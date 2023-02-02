//
//  RegistrationScreen.swift
//  Banka
//
//  Created by Alish Aidarkhan on 28.09.2022.
//

import SwiftUI

struct RegistrationScreen: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatedPassword: String = ""
    
    var body: some View {
        ZStack {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Spacer()
                
                HStack {
                    Spacer()
                    TextLogo()
                    Spacer()
                }
                .padding(.bottom, 16)
                
                Text("Регистрация")
                    .font(Font.system(size: 24, weight: .black))
                    .foregroundColor(.cWhite)
                    .padding(.bottom, 8)
                
                ZStack {
                    TextField("Ваше имя", text: $name)
                        .modifier(RoundedFieldModifier())
                }
                .padding(.bottom, 4)
                
                ZStack {
                    TextField("Электронный адрес", text: $email)
                        .modifier(RoundedFieldModifier())
                        .keyboardType(.emailAddress)
                }
                .padding(.bottom, 4)
                
                ZStack {
                    SecureField("Пароль", text: $password)
                        .modifier(RoundedFieldModifier())
                }
                .padding(.bottom, 4)
                
                ZStack {
                    SecureField("Повторите пароль", text: $repeatedPassword)
                        .modifier(RoundedFieldModifier())
                }
                .padding(.bottom, 32)
                
                Button {
                    print("Click")
                } label: {
                    RoundedButton(title: "Начать")
                }
            }
            .padding(16)
        }.navigationBarHidden(true)
    }
}
