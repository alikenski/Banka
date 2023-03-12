//
//  OnboardingThreeScreen.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 30.01.2023.
//

import SwiftUI

struct OnboardingThreeScreen: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    private let userDefaults: UserDefaultWrapper = .init()
    private var gridItemLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let itemHeight: CGFloat = 135
    
    var body: some View {
        ZStack {
            Color.cBackDark.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .fill(Color.cWhite)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color.cWhite)
                        .frame(width: 8, height: 8)
                        
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.cBlue)
                        .frame(width: 25, height: 8)
                        .padding(.trailing, 12)
                    
                    Text("3/3")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.cWhite)
                }
                .padding(.bottom, 24)
                
                TextLogo()
                Spacer()
                
                LazyVGrid(columns: gridItemLayout, spacing: 8) {
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cBackLight)
                        VStack(alignment: .center) {
                            Text("onb_three_necessary_title")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("onb_three_necessary_description")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cBackLight)
                        VStack(alignment: .center) {
                            Text("onb_three_entertainment_title")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("onb_three_entertainment_description")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cBackLight)
                        VStack(alignment: .center) {
                            Text("onb_three_investment_title")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("onb_three_investment_description")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cBackLight)
                        VStack(alignment: .center) {
                            Text("onb_three_education_title")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("onb_three_education_description")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cBackLight)
                        VStack(alignment: .center) {
                            Text("onb_three_reserve_title")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("onb_three_reserve_description")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cBackLight)
                        VStack(alignment: .center) {
                            Text("onb_three_charity_title")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("onb_three_charity_description")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                }
                .padding(.bottom, 8)
                
                Button {
                    userDefaults.isSeenOnboarding = true
                    appCoordinator.activeFlow = .main
                } label: {
                    RoundedButton(title: "onb_three_start", background: .cPrimary, foregroundColor: .cWhite)
                }
            }
            .padding(16)
        }
        .navigationBarHidden(true)
    }
}
