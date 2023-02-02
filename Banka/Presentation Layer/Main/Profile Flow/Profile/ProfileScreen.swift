//
//  ProfileScreen.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 02.12.2022.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                headerView
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
    }
    
    var headerView: some View {
        HStack {
            Text("Профиль")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.cWhite)
        }
    }
}
