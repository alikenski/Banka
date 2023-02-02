//
//  BankaStorage.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 22.01.2023.
//

import Realm
import RealmSwift

class BankaStorage {
    private var dataBase: Realm
    private let defaultBankas = [
        BankaModel(id: 1, title: "Необходимое", amount: 0, percent: 55),
        BankaModel(id: 2, title: "Развлечение", amount: 0, percent: 10),
        BankaModel(id: 3, title: "Инвестиция", amount: 0, percent: 10),
        BankaModel(id: 4, title: "Образование", amount: 0, percent: 10),
        BankaModel(id: 5, title: "Резерв", amount: 0, percent: 10),
        BankaModel(id: 6, title: "Благое дело", amount: 0, percent: 5)
    ]
    
    private let historyStorage = HistoryStorage()
    
    init() {
        let realmUrl = try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        .appendingPathComponent("Banka.realm")
        
        var realmConfig = Realm.Configuration()
        realmConfig.fileURL = realmUrl

        dataBase = try! Realm(configuration: realmConfig)
        createIfNotExists()
    }
    
    private func createIfNotExists() {
        let result = dataBase.objects(RBankaModel.self)
        if result.isEmpty {
            defaultBankas.forEach({ banka in
                let realmBanka = RBankaModel()
                
                realmBanka.id = banka.id
                realmBanka.title = banka.title
                realmBanka.percent = banka.percent
                realmBanka.amount = banka.amount
                
                DispatchQueue.main.async {
                    do {
                        try self.dataBase.write {
                            self.dataBase.add(realmBanka)
                        }
                    } catch {
                        print("###: BankaStorage - Ошибка при инициализаций БД")
                    }
                }
            })
        }
    }
}

extension BankaStorage: BankaRepositoryProtocol {
    func updateBankas(list: [BankaModel], from: String, completion: (() -> Void)? = nil) {
        list.forEach { banka in
            let result = dataBase.objects(RBankaModel.self)
                .filter("id == \(banka.id)")
            do {
                try dataBase.write({
                    let foundBanka = result.first!
                    foundBanka.setValue(foundBanka.amount + banka.amount, forKey: "amount")
                    dataBase.add(foundBanka, update: .modified)
                })
            } catch {
                print("###: BankaStorage - Ошибка при изменения БД")
            }
        }
        
        let totalAmount = list.reduce(0) { (x, y) -> Double in
            x + y.amount
        }
        
        historyStorage.addHistory(history: HistoryModel(id: UUID().uuidString,
                                                        operationType: .income,
                                                        amount: totalAmount,
                                                        from: from,
                                                        to: nil,
                                                        category: nil,
                                                        date: Date().toDBString()))
        
        completion?()
    }
    
    func getBankas() -> [BankaModel] {
        let result = dataBase.objects(RBankaModel.self)
        var converted: [BankaModel] = []
        
        converted = result.map { current in
            BankaModel(id: current.id,
                       title: current.title,
                       amount: current.amount,
                       percent: current.percent)
        }
        
        return converted
    }
    
    func makeOutcome(from: BankaModel, amount: Int, category: CategoryModel, completion: (() -> Void)?) {
        let result = dataBase.objects(RBankaModel.self).filter("id == \(from.id)")
        
        do {
            try dataBase.write({
                let foundBanka = result.first!
                foundBanka.setValue(foundBanka.amount - Double(amount), forKey: "amount")
                dataBase.add(foundBanka, update: .modified)
            })
        } catch {
            print("###: BankaStorage - Ошибка при изменения БД")
        }
        
        historyStorage.addHistory(history: HistoryModel(id: UUID().uuidString,
                                                        operationType: .outcome,
                                                        amount: Double(amount),
                                                        from: from.title,
                                                        to: nil,
                                                        category: category.title,
                                                        date: Date().toDBString()))
        
        completion?()
    }
    
    func makeTransfer(from: BankaModel, to: BankaModel, amount: Int, completion: (() -> Void)?) {
        let dbFrom = dataBase.objects(RBankaModel.self).filter("id == \(from.id)")
        let dbTo = dataBase.objects(RBankaModel.self).filter("id == \(to.id)")
        
        do {
            try dataBase.write({
                let foundBanka = dbFrom.first!
                foundBanka.setValue(foundBanka.amount - Double(amount), forKey: "amount")
                dataBase.add(foundBanka, update: .modified)
            })
        } catch {
            print("###: BankaStorage - Ошибка при изменения БД")
        }
        
        do {
            try dataBase.write({
                let foundBanka = dbTo.first!
                foundBanka.setValue(foundBanka.amount + Double(amount), forKey: "amount")
                dataBase.add(foundBanka, update: .modified)
            })
        } catch {
            print("###: BankaStorage - Ошибка при изменения БД")
        }
        
        historyStorage.addHistory(history: HistoryModel(id: UUID().uuidString,
                                                        operationType: .transfer,
                                                        amount: Double(amount),
                                                        from: from.title,
                                                        to: to.title,
                                                        category: nil,
                                                        date: Date().toDBString()))
        
        completion?()
    }
}
