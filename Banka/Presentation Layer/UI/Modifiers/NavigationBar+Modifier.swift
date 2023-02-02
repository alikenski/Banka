//
//  NavigationBar+Modifier.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 26.01.2023.
//

import SwiftUI

struct NavBarWithtitle: ViewModifier {
    var title: String
    var withBackButton: Bool
    var backButtonAction: (() -> Void)?
    
    init(title: String, withBackButton: Bool = false, backButtonAction: (() -> Void)? = nil) {
        self.title = title
        self.withBackButton = withBackButton
        self.backButtonAction = backButtonAction
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(title)
                            .font(Font.system(size: 16, weight: .black))
                            .foregroundColor(Color.cWhite)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}


struct NavBarBackButton: ViewModifier {
    var backButtonAction: (() -> Void)
    
    init(backButtonAction: @escaping (() -> Void)) {
        self.backButtonAction = backButtonAction
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        backButtonAction()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}
