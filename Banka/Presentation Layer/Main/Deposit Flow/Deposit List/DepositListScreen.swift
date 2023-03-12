//
//  DepositListScreen.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 02.12.2022.
//

import SwiftUI

// title
// expiration date
// total sum
// current sum
//

struct DepositListScreen: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Color.cBackDark.ignoresSafeArea()
            VStack(alignment: .leading) {
                headerView
                Spacer()
                ScrollView(showsIndicators: false) {
                    depositBlock
                    depositBlock
                }
                Spacer()
                NavigationLink(destination: DepositAddScreen()) {
                    RoundedButton(title: "Создать новый депозит",
                                  background: .cPrimary,
                                  foregroundColor: .cWhite)
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 8)
            .padding(.horizontal, 16)
        }
    }
    
    var headerView: some View {
        HStack {
            Text("Депозит")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.cWhite)
        }
    }
    
    var depositBlock: some View {
        VStack(alignment: .leading) {
            Text("Первоначалка для авто")
                .foregroundColor(.cWhite)
                .font(Font.system(size: 16, weight: .black))
            HStack {
                Circle()
                    .fill(Color.cGreen)
                    .frame(width: 6, height: 6)
                Text("Осталось 6 дней")
                    .foregroundColor(.cGray)
                    .font(Font.system(size: 14, weight: .regular))
            }
            
            ProgressView("11 000 000T / 12 000 000T", value: 88, total: 100)
                .tint(Color.cGreen)
                .foregroundColor(.cWhite)
                .padding(.bottom, 12)
            
            HStack {
                Spacer()
                Button {
                    print("click")
                } label: {
                    Text("Пополнить")
                        .foregroundColor(.cBlue)
                        .font(.system(size: 16, weight: .black))
                }
                Spacer()
            }
            
        }
        .padding(16)
        .background(Color.cBackLight)
        .cornerRadius(16)
    }
}
