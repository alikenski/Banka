//
//  CurrencyModel.swift
//  
//
//  Created by Alisher Aidarkhan on 07.11.2022.
//

import Foundation

public enum CurrencyModel: String, CaseIterable {
    case kzt
    case kgs
    case uzs
    case rub
    case byn
    case uah
    case usd
    case eur
    
    public var fullName: LocalizedStringResource {
        switch self {
        case .kzt:
            return "currency_kzt"
        case .rub:
            return "currency_rub"
        case .kgs:
            return "currency_kgs"
        case .uzs:
            return "currency_uzs"
        case .byn:
            return "currency_byn"
        case .uah:
            return "currency_uah"
        case .usd:
            return "currency_usd"
        case .eur:
            return "currency_eur"
        }
    }
    
    // MARK: - Название по международному стандарту
    public var ISO: String {
        switch self {
        case .kzt:
            return "KZT"
        case .rub:
            return "RUB"
        case .kgs:
            return "KGS"
        case .uzs:
            return "UZS"
        case .byn:
            return "BYN"
        case .uah:
            return "UAH"
        case .usd:
            return "USD"
        case .eur:
            return "EUR"
        }
    }
    
    // MARK: - Название по международному стандарту
    public var sign: String {
        switch self {
        case .kzt:
            return "₸"
        case .rub:
            return "₽"
        case .kgs:
            return "KGS"
        case .uzs:
            return "UZS"
        case .byn:
            return "BYN"
        case .uah:
            return "₴"
        case .usd:
            return "$"
        case .eur:
            return "€"
        }
    }
}

