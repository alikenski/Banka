//
//  View+Toast.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 30.01.2023.
//

import SwiftUI

extension View {
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
