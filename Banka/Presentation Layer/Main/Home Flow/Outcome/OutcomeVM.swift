//
//  OutcomeVM.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 26.01.2023.
//

import Foundation
import Combine

class OutcomeVM: ObservableObject {
    @Published var amount: String = ""
    @Published var categoryList: [CategoryModel] = []
    @Published var bankaList: [BankaModel] = []
    @Published var chosenBanka: BankaModel?
    @Published var chosenCategory: CategoryModel?
    @Published var toast: Toast? = nil
    
    private let categoryStorage: CategoryStorage = .init()
    private var bankaStorage: BankaStorage = .init()
    var dismissPublisher = PassthroughSubject<Bool, Never>()
    
    init() {
        getCategoryListFromDB()
        getBankaListFromDB()
    }
    
    private func getCategoryListFromDB() {
        categoryList = categoryStorage.getCategories()
    }
    
    private func getBankaListFromDB() {
        bankaList = bankaStorage.getBankas()
    }
    
    func chooseBanka(_ banka: BankaModel) {
        chosenBanka = banka
    }
    
    func chooseCategory(_ category: CategoryModel) {
        chosenCategory = category
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
        
        guard let chosenBanka else {
            toast = Toast(type: .warning, title: "Упс, банка", message: "Нужно выбрать банку чтобы списать с него денег")
            return
        }
        
        if let numberAmount = Double(amount), chosenBanka.amount < numberAmount {
            toast = Toast(type: .warning, title: "Не хватает :(", message: "Сумма привышает сумму которая в банке")
            return
        }
        
        guard let chosenCategory else {
            toast = Toast(type: .warning, title: "Упс, категория", message: "Ныжно выбрать категорию куда вы потратили чтобы мы записали в историю :)")
            return
        }
        
        bankaStorage.makeOutcome(from: chosenBanka, amount: intAmount, category: chosenCategory) { [weak self] in
            self?.dismissPublisher.send(true)
        }
    }
}
