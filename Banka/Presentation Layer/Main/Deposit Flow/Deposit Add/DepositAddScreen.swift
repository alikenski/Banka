//
//  DepositAddScreen.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 20.02.2023.
//

import SwiftUI

struct DepositAddScreen: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                headerView
            }
        }
    }
    
    var headerView: some View {
        HStack {
            Text("Новый депозит")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.cWhite)
        }
    }
}
