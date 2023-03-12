//
//  BankaModel.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 09.01.2023.
//

import Foundation

struct BankaModel: Codable, Hashable, Identifiable {
    let id: Int
    var amount: Double
    let percent: Double
    let type: BankaType
}
