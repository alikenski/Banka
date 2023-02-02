//
//  BankaRepositoryProtocol.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 17.01.2023.
//

import Foundation

protocol BankaRepositoryProtocol {
    func updateBankas(list: [BankaModel], from: String, completion: (() -> Void)?)
    func getBankas() -> [BankaModel]
    func makeOutcome(from: BankaModel,
                     amount: Int,
                     category: CategoryModel,
                     completion: (() -> Void)?)
    func makeTransfer(from: BankaModel, to: BankaModel, amount: Int, completion: (() -> Void)?)
}
