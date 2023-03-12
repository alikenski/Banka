//
//  TextField+Modifier.swift
//  Banka
//
//  Created by Alish Aidarkhan on 28.09.2022.
//

import SwiftUI

struct RoundedFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(Color.cBackLight)
            .cornerRadius(8)
            .foregroundColor(Color.cWhite)
            .font(Font.system(size: 16, weight: .regular))
    }
}


struct AmountFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .foregroundColor(Color.cWhite)
            .multilineTextAlignment(.trailing)
            .font(Font.system(size: 30, weight: .black, design: .monospaced))
    }
}
