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
    @Persisted var from: String
    @Persisted var to: String?
    @Persisted var category: String?
    @Persisted var date: String
}
