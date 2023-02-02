//
//  AppCoordinator.swift
//  
//
//  Created by Alisher Aidarkhan on 07.11.2022.
//

import Foundation

enum LaunchInstructor {
    case onboarding, main
        
    static func setup() -> LaunchInstructor {
        let userDefaults: UserDefaultWrapper = .init()
        
        switch userDefaults.isSeenOnboarding {
        case false:
            return .onboarding
        case true:
            return .main
        }
    }
}

class AppCoordinator: ObservableObject {
    @Published var activeFlow: LaunchInstructor = LaunchInstructor.setup()
}
