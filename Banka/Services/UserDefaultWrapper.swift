//
//  UserDefaultWrapper.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 30.01.2023.
//

import Foundation

enum UserDefaultKey: String {
    case isSeenOnboarding = "isSeenOnboarding"
    case currentCurrency = "currentCurrency"
}

class UserDefaultWrapper {
    private let defaults = UserDefaults.standard
    
    var currentCurrency: String {
        set {
            defaults.set(newValue, forKey: UserDefaultKey.currentCurrency.rawValue)
        }
        
        get {
            return defaults.string(forKey: UserDefaultKey.currentCurrency.rawValue) ?? ""
        }
    }
    
    var isSeenOnboarding: Bool {
        set {
            defaults.set(newValue, forKey: UserDefaultKey.isSeenOnboarding.rawValue)
        }
        
        get {
            return defaults.bool(forKey: UserDefaultKey.isSeenOnboarding.rawValue) 
        }
    }
}
