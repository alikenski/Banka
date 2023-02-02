//
//  HomeVM.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 01.12.2022.
//

import Foundation


class HomeVM: ObservableObject {
    @Published var bankaList: [BankaModel] = []
    @Published var totalAmount: Double = 0
    
    private var bankaStorage = BankaStorage()
    
    private func getBankaListFromDB() {
        bankaList = bankaStorage.getBankas()
        totalAmount = bankaList.reduce(0) { (x, y) -> Double in
            x + y.amount
        }
    }
    
    func updateBankas() {
        getBankaListFromDB()
    }
}
