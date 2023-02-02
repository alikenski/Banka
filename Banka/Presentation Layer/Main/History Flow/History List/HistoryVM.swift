//
//  HistoryVM.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 31.01.2023.
//

import Foundation

class HistoryVM: ObservableObject {
    @Published var historyList: [HistoryModel] = []
    
    private let historyStorage: HistoryStorage = .init()
    
    init() {
        getHistoryListFromDB()
    }
    
    private func getHistoryListFromDB() {
        historyList = historyStorage.getHistory()
    }
    
    func updateHistoryList() {
        historyList = historyStorage.getHistory()
    }
}
