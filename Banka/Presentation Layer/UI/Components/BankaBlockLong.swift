//
//  BankaBlockLong.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 09.01.2023.
//

import SwiftUI

struct BankaBlockLong: View {
    @Binding var model: BankaModel
    private let userDefaults: UserDefaultWrapper = .init()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(model.type.title)
                        .foregroundColor(model.type.color)
                        .font(.system(size: 18, weight: .medium))
                    Spacer()
                    Text("\(model.percent.toZero)%")
                        .foregroundColor(.cGray)
                }
                
                Text("\(model.amount.toZero)\(userDefaults.currentCurrency)")
                    .font(.system(size: 30, weight: .black, design: .monospaced))
                    .foregroundColor(.cWhite)
            }
            .padding(.all, 16)
            Spacer()
        }
        .background(Color.cBackLight)
        .cornerRadius(16)
    }
}
