//
//  OperationType.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 22.01.2023.
//

import Realm
import RealmSwift

enum OperationType: String, PersistableEnum, Codable {
    case income
    case outcome
    case transfer
}
