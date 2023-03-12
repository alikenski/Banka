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
    private let defaultBankas = cDefaultBankas
    
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
                realmBanka.percent = banka.percent
                realmBanka.amount = banka.amount
                realmBanka.type = banka.type
                
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
    func updateBankas(list: [BankaModel], from: IncomeType, completion: (() -> Void)? = nil) {
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
                                                        fromBanka: nil,
                                                        fromIncome: from,
                                                        toBanka: nil,
                                                        toCategory: nil,
                                                        date: Date()))
        
        completion?()
    }
    
    func getBankas() -> [BankaModel] {
        let result = dataBase.objects(RBankaModel.self)
        var converted: [BankaModel] = []
        
        converted = result.map { current in
            BankaModel(id: current.id,
                       amount: current.amount,
                       percent: current.percent,
                       type: current.type)
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
                                                        fromBanka: from.type,
                                                        fromIncome: nil,
                                                        toBanka: nil,
                                                        toCategory: category.type,
                                                        date: Date()))
        
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
                                                        fromBanka: from.type,
                                                        fromIncome: nil,
                                                        toBanka: to.type,
                                                        toCategory: nil,
                                                        date: Date()))
        completion?()
    }
}
