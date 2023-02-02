//
//  RBankaModel.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 22.01.2023.
//

import Realm
import RealmSwift

class RBankaModel: RealmSwiftObject {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var percent: Double
    @Persisted var amount: Double
}
