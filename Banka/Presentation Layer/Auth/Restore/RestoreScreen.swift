//
//  RestoreScreen.swift
//  Banka
//
//  Created by Alish Aidarkhan on 30.09.2022.
//

import SwiftUI

private enum RestoreScreenState {
    case email
    case code
    case password
}

struct RestoreScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @State private var screenState: RestoreScreenState = .email
    
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
                
                Text("Восстановление")
                    .font(Font.system(size: 24, weight: .black))
                    .foregroundColor(.cWhite)
                    .padding(.bottom, 8)
                
                if screenState == .email {
                    Text("На этот электронный адрес мы отправим код для дальнейших действий")
                        .font(Font.system(size: 16, weight: .regular))
                        .foregroundColor(.cWhite)
                        .padding(.bottom, 8)
                    ZStack {
                        TextField("Эл. адрес", text: $email)
                            .modifier(RoundedFieldModifier())
                            .keyboardType(.emailAddress)
                    }
                    .padding(.bottom, 4)
                    
                    Button {
                        screenState = .code
                    } label: {
                        RoundedButton(title: "Отправить код ")
                    }
                } else if screenState == .code {
                    Text("Напишите полученный код на ваш электронный адрес")
                        .font(Font.system(size: 16, weight: .regular))
                        .foregroundColor(.cWhite)
                        .padding(.bottom, 8)
                    ZStack {
                        TextField("Код с письма", text: $email)
                            .modifier(RoundedFieldModifier())
                            .keyboardType(.numberPad)
                    }
                    .padding(.bottom, 4)
                    
                    Button {
                        screenState = .password
                    } label: {
                        RoundedButton(title: "Подтвердить код ")
                    }
                } else if screenState == .password {
                    Text("Придумайте новый пароль и запишите чтобы не забыть :)")
                        .font(Font.system(size: 16, weight: .regular))
                        .foregroundColor(.cWhite)
                        .padding(.bottom, 8)
                    ZStack {
                        SecureField("Новый пароль", text: $email)
                            .modifier(RoundedFieldModifier())
                            .keyboardType(.default)
                    }
                    .padding(.bottom, 4)
                    ZStack {
                        SecureField("Повторите пароль", text: $email)
                            .modifier(RoundedFieldModifier())
                            .keyboardType(.default)
                    }
                    .padding(.bottom, 4)
                    
                    Button {
                        screenState = .email
                    } label: {
                        RoundedButton(title: "Обновить пароль")
                    }
                }
                
               
            }
            .padding(16)
        }.navigationBarHidden(true)
    }
}
