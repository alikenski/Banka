//
//  MainTab.swift
//  
//
//  Created by Alisher Aidarkhan on 07.11.2022.
//

import SwiftUI

struct MainTab: View {
    @State var tabSelection: Int = 0
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.cGray)
        UITabBar.appearance().backgroundColor = UIColor(Color.cBackLight)
        UITabBar.appearance().barTintColor = UIColor(Color.cBackLight)
        UITabBar.appearance().tintColor = UIColor(Color.cBlack)
        UITabBar.appearance().isTranslucent = true
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomeRootScreen()
                .tag(1)
                .tabItem {
                    Label("Главная", systemImage: "house.fill")
                }
            HistoryRootScreen()
                .tag(2)
                .tabItem {
                    Label("История", systemImage: "newspaper.fill")
                }
            DepositRootScreen()
                .tag(3)
                .tabItem {
                    Label("Депозит", systemImage: "shield.fill")
                }
            ProfileRootScreen()
                .tag(4)
                .tabItem {
                    Label("Профиль", systemImage: "person.fill")
                }
        }
        .accentColor(Color.cWhite)
    }
}
