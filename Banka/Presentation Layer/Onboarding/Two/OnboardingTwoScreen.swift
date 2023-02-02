//
//  OnboardingTwoScreen.swift
//  Banka
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import SwiftUI

struct OnboardingTwoScreen: View {
    @StateObject var viewModel: OnboardingTwoVM = .init()
//    
    @State private var showNextScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                NavigationLink(destination: OnboardingThreeScreen(), isActive: $showNextScreen) {
                    EmptyView()
                }
                
                HStack {
                    Circle()
                        .fill(Color.cWhite)
                        .frame(width: 8, height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.cBlue)
                        .frame(width: 25, height: 8)
                    
                    Circle()
                        .fill(Color.cWhite)
                        .frame(width: 8, height: 8)
                        .padding(.trailing, 12)
                    
                    Text("2/3")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.cGray)
                }
                .padding(.bottom, 24)
                
                TextLogo()
                Spacer()
                
                Text("Выберите валюту для дальнейшей работы с ней")
                    .font(.system(size: 32, weight: .black))
                    .foregroundColor(.cWhite)
                    .padding(.bottom, 8)
                
                Picker("Выберите валюту", selection: $viewModel.choosenCurrency) {
                    ForEach(viewModel.currencyList, id: \.self) {
                        Text($0.fullName)
                            .foregroundColor(Color.cWhite)
                    }
                }
                .pickerStyle(.wheel)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Позже можно изменить в настройках приложения")
                        .foregroundColor(.cGray)
                        .font(.system(size: 12))
                    Spacer()
                }
               
                
                Button {
                    viewModel.chooseCurrency()
                    showNextScreen = true
                } label: {
                    RoundedButton(title: "Сохранить и дальше")
                }
            }
            .padding(16)
        }
        .navigationBarHidden(true)
    }
}
