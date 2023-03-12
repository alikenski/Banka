//
//  IncomeType.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 16.01.2023.
//

import Foundation
import RealmSwift

enum IncomeType: String, CaseIterable, Codable, PersistableEnum {
    case salary
    case business
    case other
    
    var id: Int {
        switch self {
        case .salary:
            return 1
        case .business:
            return 2
        case .other:
            return 3
        }
    }
    
    var title: LocalizedStringResource {
        switch self {
        case .salary:
            return "Income_work"
        case .business:
            return "Income_business"
        case .other:
            return "Income_other"
        }
    }
}
