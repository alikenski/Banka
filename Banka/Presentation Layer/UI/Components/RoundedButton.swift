//
//  RoundedButton.swift
//  Banka
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import SwiftUI

struct RoundedButton: View {
    @State var title: LocalizedStringKey = ""
    var background: Color = .cBackLight
    var foregroundColor: Color = .cWhite
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(background)
                .frame(height: 44)
            Text(title)
                .foregroundColor(foregroundColor)
                .font(Font.system(size: 16, weight: .black))
        }
    }
}
