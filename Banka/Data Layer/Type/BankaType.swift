//
//  BankaType.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 23.02.2023.
//

import SwiftUI
import RealmSwift

enum BankaType: String, Codable, PersistableEnum {
    case necessary
    case entertainment
    case investment
    case education
    case reserve
    case charity
    
    var color: Color {
        switch self {
        case .necessary:
            return .cCoral
        case .entertainment:
            return .cBlue
        case .investment:
            return .cGreen
        case .education:
            return .cOrange
        case .reserve:
            return .cPink
        case .charity:
            return .cPurple
        }
    }
    
    var title: LocalizedStringResource {
        switch self {
        case .necessary:
            return "Banka_necessary"
        case .entertainment:
            return "Banka_entertainment"
        case .investment:
            return "Banka_investment"
        case .education:
            return "Banka_education"
        case .reserve:
            return "Banka_reserve"
        case .charity:
            return "Banka_charity"
        }
    }
}
