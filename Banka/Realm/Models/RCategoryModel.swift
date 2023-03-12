//
//  RCategoryModel.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 26.01.2023.
//

import Realm
import RealmSwift

class RCategoryModel: RealmSwiftObject {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var icon: String
    @Persisted var type: CategoryType
}
