//
//  CircleIconButton.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 26.01.2023.
//

import SwiftUI

struct CircleIconButton: View {
    var imageName: String
    var title: String?
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.cGray)
                Image(systemName: imageName)
                    .foregroundColor(Color.cWhite)
                    .font(.system(size: 18, weight: .bold))
            }
            .frame(width: 50, height: 50)
            
            if let title {
                Text(title)
                    .foregroundColor(Color.cWhite)
                    .font(Font.system(size: 14))
            }
        }
        
    }
}
