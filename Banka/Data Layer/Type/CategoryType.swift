//
//  CategoryType.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 12.03.2023.
//

import Foundation
import RealmSwift

enum CategoryType: String, PersistableEnum, Codable {
    case products
    case medications
    case credit
    case auto
    case payments
    case cloth
    case transport
    case apartment
    case child
    case education
    case charity
    case gift
    case entertainment
    
    var title: LocalizedStringResource {
        switch self {
        case .products:
            return "Outcome_products"
        case .medications:
            return "Outcome_medications"
        case .credit:
            return "Outcome_credit"
        case .auto:
            return "Outcome_auto"
        case .payments:
            return "Outcome_payments"
        case .cloth:
            return "Outcome_cloth"
        case .transport:
            return "Outcome_transport"
        case .apartment:
            return "Outcome_apartment"
        case .child:
            return "Outcome_child"
        case .education:
            return "Outcome_education"
        case .charity:
            return "Outcome_charity"
        case .gift:
            return "Outcome_gift"
        case .entertainment:
            return "Outcome_entertainment"
        }
    }
}
