//
//  OnboardingOneScreen.swift
//  Banka
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import SwiftUI

struct OnboardingOneScreen: View {
    @State private var showNextScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.cBackDark.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                NavigationLink(destination: OnboardingTwoScreen(), isActive: $showNextScreen) {
                    EmptyView()
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.cBlue)
                        .frame(width: 25, height: 8)
                    Circle()
                        .fill(Color.cWhite)
                        .frame(width: 8, height: 8)
                    Circle()
                        .fill(Color.cWhite)
                        .frame(width: 8, height: 8)
                        .padding(.trailing, 12)
                    Text("1/3")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.cWhite)
                }
                .padding(.bottom, 24)
                
                TextLogo()
                Spacer()
                
                Text("onb_one_title")
                    .font(.system(size: 32, weight: .black))
                    .foregroundColor(Color.cWhite)
                    .padding(.bottom, 12)
                Text("onb_one_description")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(Color.cWhite)
                Spacer()
                
                Button {
                    showNextScreen = true
                } label: {
                    RoundedButton(title: "onb_one_choose_currency",
                                  background: .cPrimary,
                                  foregroundColor: .cWhite)
                }
            }
            .padding(16)
        }.navigationBarHidden(true)
    }
}
