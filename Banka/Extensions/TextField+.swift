//
//  TextField+.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 16.01.2023.
//

import SwiftUI


extension TextField {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
