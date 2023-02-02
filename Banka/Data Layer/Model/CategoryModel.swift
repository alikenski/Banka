//
//  CategoryModel.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 29.01.2023.
//


struct CategoryModel: Codable, Hashable, Identifiable {
    let id: Int
    let title: String
    let icon: String
}
