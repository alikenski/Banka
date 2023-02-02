//
//  HistoryModel.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 31.01.2023.
//

import Foundation


struct HistoryModel: Codable, Hashable, Identifiable {
    let id: String
    let operationType: OperationType
    let amount: Double
    let from: String
    let to: String?
    let category: String?
    let date: String
}
