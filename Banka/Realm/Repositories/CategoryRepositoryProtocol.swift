//
//  CategoryRepositoryProtocol.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 29.01.2023.
//

import Foundation

protocol CategoryRepositoryProtocol {
    func getCategories() -> [CategoryModel]
}
