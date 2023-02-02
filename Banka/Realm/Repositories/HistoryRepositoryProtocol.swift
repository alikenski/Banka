//
//  HistoryRepositoryProtocol.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 22.01.2023.
//

import Foundation

protocol HistoryRepositoryProtocol {
    func addHistory(history: HistoryModel)
    func getHistory() -> [HistoryModel]
}
