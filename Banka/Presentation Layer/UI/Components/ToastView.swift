//
//  ToastView.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 30.01.2023.
//

import SwiftUI

struct Toast: Equatable {
    var type: ToastStyle
    var title: String
    var message: String
    var duration: Double = 3
}

enum ToastStyle {
    case error
    case warning
    case success
    case info
}

extension ToastStyle {
    var themeColor: Color {
        switch self {
        case .error: return Color.red
        case .warning: return Color.orange
        case .info: return Color.blue
        case .success: return Color.green
        }
    }
    
    var iconFileName: String {
        switch self {
        case .info: return "info.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
}

struct ToastView: View {
    var type: ToastStyle
    var title: String
    var message: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: type.iconFileName)
                    .foregroundColor(type.themeColor)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(.cWhite)
                        .font(.system(size: 14, weight: .black))
                    
                    Text(message)
                        .foregroundColor(.cWhite)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color.cWhite)
                }
                
                Spacer()
            }
            .padding(12)
        }
        .background(Color.cBackLight)
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
    }
}
