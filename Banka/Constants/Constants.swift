//
//  Constants.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 23.02.2023.
//

import Foundation

let cDefaultBankas = [
    BankaModel(id: 1, amount: 0, percent: 55, type: .necessary),
    BankaModel(id: 2, amount: 0, percent: 10, type: .entertainment),
    BankaModel(id: 3, amount: 0, percent: 10, type: .investment),
    BankaModel(id: 4, amount: 0, percent: 10, type: .education),
    BankaModel(id: 5, amount: 0, percent: 10, type: .reserve),
    BankaModel(id: 6, amount: 0, percent: 5, type: .charity)
]

let cDefaultCategories = [
    CategoryModel(id: 1, icon: "takeoutbag.and.cup.and.straw.fill", type: .products),
    CategoryModel(id: 2, icon: "pills.fill", type: .medications),
    CategoryModel(id: 3, icon: "percent", type: .credit),
    CategoryModel(id: 4, icon: "car.fill", type: .auto),
    CategoryModel(id: 5, icon: "creditcard.fill", type: .payments),
    CategoryModel(id: 6, icon: "tshirt.fill", type: .cloth),
    CategoryModel(id: 7, icon: "bus.fill", type: .transport),
    CategoryModel(id: 8, icon: "house.lodge.fill", type: .apartment),
    CategoryModel(id: 9, icon: "stroller.fill", type: .child),
    CategoryModel(id: 10, icon: "graduationcap.fill", type: .education),
    CategoryModel(id: 11, icon: "gift.fill", type: .gift),
    CategoryModel(id: 12, icon: "heart.fill", type: .charity),
    CategoryModel(id: 13, icon: "theatermasks.fill", type: .entertainment)
]
