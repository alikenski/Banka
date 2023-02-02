//
//  BankaApp.swift
//  Banka
//
//  Created by Alish Aidarkhan on 19.09.2022.
//

import SwiftUI

@main
struct BankaApp: App {
    @StateObject var launchInstructor: AppCoordinator = AppCoordinator()
    
    private let categoryStorage: CategoryStorage = .init()
    private let bankaStorage: BankaStorage = .init()
    
    var body: some Scene {
        WindowGroup {
            if launchInstructor.activeFlow == .main {
                MainTab()
                    .environment(\.locale, .init(identifier: "ru"))
            } else if launchInstructor.activeFlow == .onboarding {
                OnboardingRootScreen()
                    .environmentObject(launchInstructor)
                    .environment(\.locale, .init(identifier: "ru"))
            }
        }
    }
}
