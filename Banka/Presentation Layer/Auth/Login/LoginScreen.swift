//
//  LoginScreen.swift
//  Banka
//
//  Created by Alish Aidarkhan on 24.09.2022.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    @State var name: String = ""
    @State var password: String = ""
    
    @State private var showRestoreScreen: Bool = false
    @State private var showRegistrationScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                // START: - Routers
                NavigationLink(destination: RegistrationScreen(), isActive: $showRegistrationScreen) {
                    EmptyView()
                }
                NavigationLink(destination: RestoreScreen(), isActive: $showRestoreScreen) {
                    EmptyView()
                }
                // END: - Routers
                Spacer()
                
                HStack {
                    Spacer()
                    TextLogo()
                    Spacer()
                }
                .padding(.bottom, 16)
                
                Text("Вход")
                    .font(Font.system(size: 24, weight: .black))
                    .foregroundColor(.cWhite)
                    .padding(.bottom, 8)
                
                ZStack {
                    TextField("Электронный адрес", text: $name)
                        .modifier(RoundedFieldModifier())
                        .keyboardType(.emailAddress)
                }
                .padding(.bottom, 4)
                
                ZStack {
                    SecureField("Пароль", text: $password)
                        .modifier(RoundedFieldModifier())
                }
                .padding(.bottom, 4)
                
                HStack {
                    Button("Регистрация") {
                        showRegistrationScreen = true
                    }
                    .foregroundColor(Color.cWhite)
                    Spacer()
                    Button("Забыл пароль?") {
                        showRestoreScreen = true
                    }
                    .foregroundColor(Color.cWhite)
                }
                .padding(.bottom, 32)
                
                Button {
                    appCoordinator.activeFlow = .main
                } label: {
                    RoundedButton(title: "Начать")
                }
            }
            .padding(16)
        }.navigationBarHidden(true)
    }
}
