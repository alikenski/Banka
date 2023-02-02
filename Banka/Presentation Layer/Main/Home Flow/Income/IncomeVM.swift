//
//  IncomeVM.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 09.01.2023.
//

import Foundation
import Combine

class IncomeVM: ObservableObject {
    @Published var amount: String = ""
    @Published var choosenIncomeType: IncomeType?
    @Published var bankaList: [BankaModel] = [
        BankaModel(id: 1, title: "Необходимое", amount: 0, percent: 55),
        BankaModel(id: 2, title: "Развлечение", amount: 0, percent: 10),
        BankaModel(id: 3, title: "Инвестиция", amount: 0, percent: 10),
        BankaModel(id: 4, title: "Образование", amount: 0, percent: 10),
        BankaModel(id: 5, title: "Резерв", amount: 0, percent: 10),
        BankaModel(id: 6, title: "Благое дело", amount: 0, percent: 5)
    ]
    @Published var toast: Toast? = nil
    
    private var bankaStorage = BankaStorage()
    var dismissPublisher = PassthroughSubject<Bool, Never>()
    
    func calculateBanka() {
        guard let numberAmount = Double(amount) else {
            configureList(with: 0)
            return
        }
        
        configureList(with: numberAmount)
    }
    
    private func configureList(with amount: Double) {
        bankaList = bankaList.map { banka in
            var temp = banka
            temp.amount = amount * (banka.percent / 100)
            return temp
        }
    }
    
    func saveInDB() {
        if amount.isEmpty {
            toast = Toast(type: .warning, title: "Какой доход?", message: "Напишите сколько вы заработали")
            return
        }
        
        guard let intAmount = Int(amount), intAmount > 0 else {
            toast = Toast(type: .warning, title: "Что-то пошло не так", message: "Кажется лишние символы в сумме или меньше 0")
            return
        }
        
        guard let choosenIncomeType else {
            toast = Toast(type: .warning, title: "Упс, категория", message: "Нужно выбрать категорию откуда доход чтобы мы записали в историю :)")
            return
        }
        
        bankaStorage.updateBankas(list: bankaList, from: choosenIncomeType.title) { [weak self] in
            self?.dismissPublisher.send(true)
        }
    }
}
