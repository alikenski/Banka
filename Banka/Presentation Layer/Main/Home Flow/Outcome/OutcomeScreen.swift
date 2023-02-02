//
//  OutcomeScreen.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 01.12.2022.
//

import SwiftUI

struct OutcomeScreen: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: OutcomeVM = .init()
    
    private let userDefaults: UserDefaultWrapper = .init()
    
    private var gridItemLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Сколько потратили")
                    .font(.system(size: 16, weight: .black))
                    .foregroundColor(.cWhite)
                
                TextField("", text: $viewModel.amount)
                    .placeholder(when: viewModel.amount.isEmpty,
                                 alignment: .trailing,
                                 placeholder: { Text("Введите расход").foregroundColor(Color.cGray) })
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
                                    viewModel.chooseBanka(item)
                                } label: {
                                    VStack {
                                        Text(item.title)
                                            .foregroundColor(item == viewModel.chosenBanka ? .cBlue : .cWhite)
                                            .font(.system(size: 14, weight: .black))
                                        Text("\(item.amount.toZero)\(userDefaults.currentCurrency)")
                                            .foregroundColor(item == viewModel.chosenBanka ? .cBlue : .cWhite)
                                            .font(.system(size: 14))
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 16)
                        
                        Text("Куда")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(.cWhite)
                            .padding(.bottom, 4)
                        
                        LazyVGrid(columns: gridItemLayout, spacing: 16) {
                            ForEach(viewModel.categoryList) { item in
                                Button {
                                    viewModel.chooseCategory(item)
                                } label: {
                                    VStack {
                                        Image(systemName: item.icon)
                                            .foregroundColor(item == viewModel.chosenCategory ? .cBlue : .cWhite)
                                            .frame(width: 14, height: 14)
                                        Text(item.title)
                                            .foregroundColor(item == viewModel.chosenCategory ? .cBlue : .cWhite)
                                            .font(.system(size: 14))
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 16)
                        
//                        Text("Когда")
//                            .font(.system(size: 16, weight: .black))
//                            .foregroundColor(.cWhite)
//                            .padding(.bottom, 4)
//
//                        HStack {
//                            Button {
//
//                            } label: {
//                                VStack {
//                                    Text("Позавчера")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 14, weight: .black))
//                                    Text("01.03.2023")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 14))
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
//                                        .font(.system(size: 14, weight: .black))
//                                    Text("02.03.2023")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 14))
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
//                                        .font(.system(size: 14, weight: .black))
//                                    Text("03.03.2023")
//                                        .foregroundColor(.cWhite)
//                                        .font(.system(size: 14))
//                                }
//                            }
//                        }
//                        .padding(.horizontal, 16)
//                        .padding(.bottom, 16)
                        
                        Button {
                            viewModel.saveInDB()
                        } label: {
                            RoundedButton(title: "Сохранить")
                        }
                        .padding(.bottom, 16)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .toastView(toast: $viewModel.toast)
        .modifier(NavBarWithtitle(title: "Расход"))
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
