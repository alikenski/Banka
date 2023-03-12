//
//  RHistoryModel.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 22.01.2023.
//

import Realm
import RealmSwift

class RHistoryModel: RealmSwiftObject {
    @Persisted(primaryKey: true) var id: String
    @Persisted var operationType: OperationType
    @Persisted var amount: Double
    @Persisted var fromBanka: BankaType?
    @Persisted var fromIncome: IncomeType?
    @Persisted var toBanka: BankaType?
    @Persisted var toCategory: CategoryType?
    @Persisted var date: Date
}
