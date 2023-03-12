//
//  CategoryStorage.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 29.01.2023.
//

import Foundation

import Realm
import RealmSwift

class CategoryStorage {
    private var dataBase: Realm
    private let defaultCategories = cDefaultCategories
    
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
        let result = dataBase.objects(RCategoryModel.self)
        if result.isEmpty {
            defaultCategories.forEach({ banka in
                let realmCategory = RCategoryModel()
                
                realmCategory.id = banka.id
                realmCategory.type = banka.type
                realmCategory.icon = banka.icon
                
                DispatchQueue.main.async {
                    do {
                        try self.dataBase.write {
                            self.dataBase.add(realmCategory)
                        }
                    } catch {
                        print("###: CategoryStorage - Ошибка при инициализаций БД")
                    }
                }
            })
        }
    }
}

extension CategoryStorage: CategoryRepositoryProtocol {
    func getCategories() -> [CategoryModel] {
        let result = dataBase.objects(RCategoryModel.self)
        var converted: [CategoryModel] = []
        
        converted = result.map { current in
            CategoryModel(id: current.id,
                          icon: current.icon,
                          type: current.type)
        }
        
        return converted
    }
}
