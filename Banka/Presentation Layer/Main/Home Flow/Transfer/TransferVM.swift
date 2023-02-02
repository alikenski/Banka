//
//  TransferVM.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 26.01.2023.
//

import Foundation
import Combine

class TransferVM: ObservableObject {
    @Published var amount: String = ""
    @Published var bankaList: [BankaModel] = []
    @Published var fromBanka: BankaModel?
    @Published var toBanka: BankaModel?
    @Published var toast: Toast? = nil
    
    private var bankaStorage: BankaStorage = .init()
    var dismissPublisher = PassthroughSubject<Bool, Never>()
    
    init() {
        getBankaListFromDB()
    }

    private func getBankaListFromDB() {
        bankaList = bankaStorage.getBankas()
    }
    
    func chooseBanka(from banka: BankaModel) {
        fromBanka = banka
    }

    func chooseBanka(to banka: BankaModel) {
        toBanka = banka
    }

    
    func saveInDB() {
        if amount.isEmpty {
            toast = Toast(type: .warning, title: "Сколько потратили?", message: "Напишите сколько вы потратили")
            return
        }
        
        guard let intAmount = Int(amount) else {
            toast = Toast(type: .warning, title: "Что-то пошло не так", message: "Кажется лишние символы в сумме")
            return
        }
        
        guard let fromBanka else {
            toast = Toast(type: .warning, title: "Упс, откуда перевести", message: "Нужно выбрать банку чтобы списать с него денег")
            return
        }
        
        guard let toBanka else {
            toast = Toast(type: .warning, title: "Упс, куда перевести", message: "Нужно выбрать банку чтобы добавить туда денег")
            return
        }
        
        if let numberAmount = Double(amount), fromBanka.amount < numberAmount {
            toast = Toast(type: .warning, title: "Не хватает :(", message: "Сумма превышает сумму которая в банке")
            return
        }
        
        bankaStorage.makeTransfer(from: fromBanka, to: toBanka, amount: intAmount) { [weak self] in
            self?.dismissPublisher.send(true)
        }
    }
}
