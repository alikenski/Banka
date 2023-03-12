//
//  CategoryModel.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 29.01.2023.
//

import RealmSwift

struct CategoryModel: Codable, Hashable, Identifiable {
    let id: Int
    let icon: String
    let type: CategoryType
}
