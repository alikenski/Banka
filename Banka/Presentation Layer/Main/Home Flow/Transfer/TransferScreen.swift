//
//  TransferScreen.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 26.01.2023.
//

import SwiftUI

struct TransferScreen: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: TransferVM = .init()
    
    private let userDefaults: UserDefaultWrapper = .init()
    private let gridItemLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.cBackDark.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                
                Text("Сколько перевести")
                    .font(.system(size: 16, weight: .black))
                    .foregroundColor(.cWhite)
                
                TextField("", text: $viewModel.amount)
                    .placeholder(when: viewModel.amount.isEmpty,
                                 alignment: .trailing,
                                 placeholder: { Text("Введите сумму").foregroundColor(Color.cGray) })
                    .modifier(AmountFieldModifier())
                    .keyboardType(.numberPad)
                    .padding(.bottom, 4)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Откуда")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(.cWhite)
                        
                        LazyVGrid(columns: gridItemLayout, spacing: 16) {
                            ForEach(viewModel.bankaList) { item in
                                Button {
                                    viewModel.chooseBanka(from: item)
                                } label: {
                                    VStack {
                                        Text(item.type.title)
                                            .foregroundColor(item == viewModel.fromBanka ? .cPrimary : .cWhite)
                                            .font(.system(size: 12, weight: .black))
                                        Text("\(item.amount.toZero)\(userDefaults.currentCurrency)")
                                            .foregroundColor(item == viewModel.fromBanka ? .cPrimary : .cGray)
                                            .font(.system(size: 12))
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 16)
                        
                        Text("Куда")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(.cWhite)
                        
                        LazyVGrid(columns: gridItemLayout, spacing: 16) {
                            ForEach(viewModel.bankaList) { item in
                                Button {
                                    viewModel.chooseBanka(to: item)
                                } label: {
                                    VStack {
                                        Text(item.type.title)
                                            .foregroundColor(item == viewModel.toBanka ? .cPrimary : .cWhite)
                                            .font(.system(size: 12, weight: .black))
                                        Text("\(item.amount.toZero)\(userDefaults.currentCurrency)")
                                            .foregroundColor(item == viewModel.toBanka ? .cPrimary : .cGray)
                                            .font(.system(size: 12))
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 16)
                        
//                        Text("Когда")
//                            .font(.system(size: 16, weight: .black))
//                            .foregroundColor(.cWhite)
//                            .padding(.bottom, 4)
//                        HStack {
//                            Button {
//
//                            } label: {
//                                VStack {
//                                    Text("Позавчера")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 12, weight: .black))
//                                    Text("01.03.2023")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 12))
//                                }
//                            }
//
//                            Spacer()
//
//                            Button {
//
//                            } label: {
//                                VStack {
//                                    Text("Вчера")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 12, weight: .black))
//                                    Text("02.03.2023")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 12))
//                                }
//                            }
//
//                            Spacer()
//
//                            Button {
//
//                            } label: {
//                                VStack(alignment: .center) {
//                                    Text("Сегодня")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 12, weight: .black))
//                                    Text("03.03.2023")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 12))
//                                }
//                            }
//                        }
//                        .padding(.horizontal, 16)
//                        .padding(.bottom, 16)
                        
                        Button {
                            viewModel.saveInDB()
                        } label: {
                            RoundedButton(title: "Сохранить", background: .cPrimary, foregroundColor: .cWhite)
                        }
                        .padding(.bottom, 16)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .toastView(toast: $viewModel.toast)
        .modifier(NavBarWithtitle(title: "Перевод"))
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
