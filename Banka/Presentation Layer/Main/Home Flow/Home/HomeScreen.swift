//
//  HomeSreen.swift
//  
//
//  Created by Alisher Aidarkhan on 07.11.2022.
//

import SwiftUI

struct BindingWrapper<T> {
    let uuid: UUID = UUID()
    @Binding var data: T
}

struct HomeScreen: View {
    @StateObject var viewModel: HomeVM = .init()
    
    private let userDefaults: UserDefaultWrapper = .init()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                headerView
                ScrollView(showsIndicators: false) {
                    totalBalance
                    VStack {
                        ForEach($viewModel.bankaList) { $banka in
                            BankaBlockLong(model: $banka)
                        }
                    }
                    .padding(.bottom, 16)
                }
                
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.updateBankas()
        }
    }
    
    var headerView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4){
                Text("Привет друг!")
                    .font(.system(size: 24, weight: .black))
                    .foregroundColor(.cWhite)
                Text("Хорошего дня👋🏽")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.cWhite)
            }
            Spacer()
        }
    }
    
    var totalBalance: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Ваш общий баланс составляет")
                    .foregroundColor(.cWhite)
                Text("\(viewModel.totalAmount.toZero)\(userDefaults.currentCurrency)")
                    .font(.system(size: 30, weight: .black, design: .monospaced))
                    .foregroundColor(.cBlue)
                    .padding(.bottom, 16)
                HStack {
                    NavigationLink {
                        IncomeScreen()
                    } label: {
                        CircleIconButton(imageName: "arrow.down.left", title: "Доход")
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        TransferScreen()
                    } label: {
                        CircleIconButton(imageName: "arrow.up.arrow.down", title: "Перевод")
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        OutcomeScreen()
                    } label: {
                        CircleIconButton(imageName: "arrow.up.right", title: "Расход")
                    }
                }
            }
            .padding(.all, 16)
            Spacer()
        }
        .background(Color.cDarkGray)
        .cornerRadius(16)
    }
}

