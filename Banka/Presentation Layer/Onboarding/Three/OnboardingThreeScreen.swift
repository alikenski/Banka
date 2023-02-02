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
            Color.cBlack.ignoresSafeArea(.all)
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
                        .foregroundColor(Color.cGray)
                }
                .padding(.bottom, 24)
                
                TextLogo()
                Spacer()
                
                LazyVGrid(columns: gridItemLayout, spacing: 8) {
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cDarkGray)
                        VStack(alignment: .center) {
                            Text("Необходимое")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("Продукты, коммунальные платежи, кредиты, лекарства, проезд, медицина и т.п.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cDarkGray)
                        VStack(alignment: .center) {
                            Text("Развлечение")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("Массаж, кафе, ресторан, концерт, театр, компьютерный клуб, кальян и т.п.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cDarkGray)
                        VStack(alignment: .center) {
                            Text("Инвестиция")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("Используется для инвестиций и получения пассивного дохода")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cDarkGray)
                        VStack(alignment: .center) {
                            Text("Образование")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("Оплата обучения, курсов, мастер-классов, тренингов, книг, онлайн курсов и т.п.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cDarkGray)
                        VStack(alignment: .center) {
                            Text("Резерв")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("Финансовая подушка безопасности (резервный фонд) и как накопления на крупные расходы")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.cWhite)
                                .font(.system(size: 12, weight: .regular))
                        }
                        .padding(16)
                    }
                    .frame(height: itemHeight)
                    
                    ZStack(alignment: .top) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.cDarkGray)
                        VStack(alignment: .center) {
                            Text("Благое дело")
                                .foregroundColor(.cWhite)
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 2)
                            Text("Использовать на цели благотворительности либо на подарки друзьям, близким, соседям")
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
                    RoundedButton(title: "Начать!")
                }
            }
            .padding(16)
        }
        .navigationBarHidden(true)
    }
}
