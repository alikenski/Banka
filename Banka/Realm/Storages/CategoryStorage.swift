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
    private let defaultCategories = [
        CategoryModel(id: 1, title: "Продукты", icon: "takeoutbag.and.cup.and.straw.fill"),
        CategoryModel(id: 2, title: "Лекарства", icon: "pills.fill"),
        CategoryModel(id: 3, title: "Кредит", icon: "percent"),
        CategoryModel(id: 4, title: "Авто", icon: "car.fill"),
        CategoryModel(id: 5, title: "Платежи", icon: "creditcard.fill"),
        CategoryModel(id: 6, title: "Одежда", icon: "tshirt.fill"),
        CategoryModel(id: 7, title: "Транспорт", icon: "bus.fill"),
        CategoryModel(id: 8, title: "Квартира", icon: "house.lodge.fill"),
        CategoryModel(id: 9, title: "Ребенок", icon: "stroller.fill"),
        CategoryModel(id: 10, title: "Образование", icon: "graduationcap.fill"),
        CategoryModel(id: 11, title: "Подарки", icon: "gift.fill"),
        CategoryModel(id: 12, title: "Благое дело", icon: "heart.fill"),
        CategoryModel(id: 13, title: "Гулянка", icon: "theatermasks.fill")
    ]
    
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
                realmCategory.title = banka.title
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
                          title: current.title,
                          icon: current.icon)
        }
        
        return converted
    }
}
