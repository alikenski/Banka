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
    
    public var fullName: String {
        switch self {
        case .kzt:
            return "Казахстанский тенге"
        case .rub:
            return "Российский рубль"
        case .kgs:
            return "Киргизский сом"
        case .uzs:
            return "Узбекский сум"
        case .byn:
            return "Белорусский рубль"
        case .uah:
            return "Украинская гривна"
        case .usd:
            return "Американский доллар"
        case .eur:
            return "Евро"
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

