//
//  OnboardingTwoVM.swift
//  Banka
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import Foundation

final class OnboardingTwoVM: ObservableObject {
    let currencyList: [CurrencyModel] = CurrencyModel.allCases
    private let userDefaults: UserDefaultWrapper = .init()
    
    @Published var choosenCurrency: CurrencyModel = CurrencyModel.allCases[0]
    
    func chooseCurrency() {
        print("###: Chosen currency", choosenCurrency.sign)
        userDefaults.currentCurrency = choosenCurrency.sign
    }
}
