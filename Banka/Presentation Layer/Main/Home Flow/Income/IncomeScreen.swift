//
//  IncomeScreen.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 01.12.2022.
//

import SwiftUI

struct IncomeScreen: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: IncomeVM = .init()
    
    var body: some View {
        ZStack {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Общая сумма")
                    .font(.system(size: 16, weight: .black))
                    .foregroundColor(.cWhite)
                TextField("", text: $viewModel.amount)
                    .placeholder(when: viewModel.amount.isEmpty,
                                 alignment: .trailing,
                                 placeholder: { Text("Введите доход").foregroundColor(Color.cGray) })
                    .modifier(AmountFieldModifier())
                    .keyboardType(.numberPad)
                    .padding(.bottom, 4)
                    .onChange(of: viewModel.amount) { _ in
                        viewModel.calculateBanka()
                    }
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text("Категория дохода")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(.cWhite)
                            .padding(.bottom, 4)
                        HStack(spacing: 16) {
                            ForEach(IncomeType.allCases, id: \.self.id) { income in
                                Button {
                                    viewModel.choosenIncomeType = income
                                } label: {
                                    Text(income.title)
                                        .font(.system(size: 16))
                                        .foregroundColor(income == viewModel.choosenIncomeType ? .cBlue : .cWhite)
                                }
                            }
                        }
                        .padding(.bottom, 16)
                        
                        Text("Распределение")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(.cWhite)
                            .padding(.bottom, 4)
                        
                        VStack {
                            ForEach($viewModel.bankaList) { $banka in
                                BankaBlockLong(model: $banka)
                            }
                        }
                        
                        Button {
                            viewModel.saveInDB()
                        } label: {
                            RoundedButton(title: "Сохранить")
                        }
                        .padding(.bottom, 16)
                    }
                    .padding(.top, 12)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .toastView(toast: $viewModel.toast)
        .onTapGesture {
            hideKeyboard()
        }
        .modifier(NavBarWithtitle(title: "Новый доход"))
        .modifier(NavBarBackButton(backButtonAction: {
            dismiss()
        }))
        .onReceive(viewModel.dismissPublisher) { shouldDismiss in
            if shouldDismiss {
                self.dismiss()
            }
        }
    }
}
