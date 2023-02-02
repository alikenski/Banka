//
//  IncomeType.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 16.01.2023.
//

import Foundation

enum IncomeType: String, CaseIterable {
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
    
    var title: String {
        switch self {
        case .salary:
            return "Зарплата"
        case .business:
            return "Бизнес"
        case .other:
            return "Другое"
        }
    }
}
