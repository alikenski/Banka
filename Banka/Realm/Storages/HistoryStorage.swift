//
//  HistoryStorage.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 22.01.2023.
//

import Realm
import RealmSwift


class HistoryStorage {
    private var dataBase: Realm
    
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
    }
}

extension HistoryStorage: HistoryRepositoryProtocol {
    func addHistory(history: HistoryModel) {
        let realmHistory = RHistoryModel()
        
        realmHistory.id = history.id
        realmHistory.operationType = history.operationType
        realmHistory.amount = history.amount
        realmHistory.fromBanka = history.fromBanka
        realmHistory.fromIncome = history.fromIncome
        realmHistory.toBanka = history.toBanka
        realmHistory.toCategory = history.toCategory
        realmHistory.date = history.date
        
        
        DispatchQueue.main.async {
            do {
                try self.dataBase.write {
                    self.dataBase.add(realmHistory)
                }
            } catch {
                print("###: HistoryStorage - Ошибка при инициализаций БД")
            }
        }
    }
    
    func getHistory() -> [HistoryModel] {
        let result = dataBase.objects(RHistoryModel.self)
        var converted: [HistoryModel] = []
        
        converted = result.map { current in
            HistoryModel(id: current.id,
                         operationType: current.operationType,
                         amount: current.amount,
                         fromBanka: current.fromBanka,
                         fromIncome: current.fromIncome,
                         toBanka: current.toBanka,
                         toCategory: current.toCategory,
                         date: current.date)
        }
        
        converted.reverse()
        
        return converted
    }
    
    
}
