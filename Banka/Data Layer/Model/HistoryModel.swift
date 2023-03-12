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
    let fromBanka: BankaType?
    let fromIncome: IncomeType?
    let toBanka: BankaType?
    let toCategory: CategoryType?
    let date: Date
}
