//
//  HistoryBlock.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 31.01.2023.
//

import SwiftUI

struct HistoryBlock: View {
    let history: HistoryModel
    private let userDefaults: UserDefaultWrapper = .init()
    
    var body: some View {
        switch history.operationType {
        case .income:
            incomeView
        case .outcome:
            outcomeView
        case .transfer:
            transferView
        }
    }
    
    var incomeView: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.cGray)
                    Image(systemName: "arrow.down.left")
                        .foregroundColor(Color.cWhite)
                        .font(.system(size: 16, weight: .medium))
                }
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text(history.fromIncome?.title ?? "")
                        .foregroundColor(.cWhite)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("+\(history.amount.toZero)\(userDefaults.currentCurrency)")
                        .foregroundColor(.cGreen)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    Text(history.date.toDBString())
                        .foregroundColor(.cGray)
                        .font(.system(size: 14, weight: .medium))
                }
            }
            .padding(.vertical, 4)
            
            RoundedRectangle(cornerRadius: 1)
                .fill(Color.cGray)
                .frame(height: 1)
                .opacity(0.7)
        }
    }
    
    var outcomeView: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.cGray)
                    Image(systemName: "arrow.up.right")
                        .foregroundColor(Color.cWhite)
                        .font(.system(size: 16, weight: .medium))
                }
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text(history.fromBanka?.title ?? "")
                        .foregroundColor(.cWhite)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    Text(history.toCategory?.title ?? "")
                        .foregroundColor(.cGray)
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("-\(history.amount.toZero)\(userDefaults.currentCurrency)")
                        .foregroundColor(.cCoral)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    Text(history.date.toDBString())
                        .foregroundColor(.cGray)
                        .font(.system(size: 14, weight: .medium))
                }
            }
            .padding(.vertical, 4)
            
            RoundedRectangle(cornerRadius: 1)
                .fill(Color.cGray)
                .frame(height: 1)
                .opacity(0.7)
        }
    }
    
    var transferView: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.cGray)
                    Image(systemName: "arrow.up.arrow.down")
                        .foregroundColor(Color.cWhite)
                        .font(.system(size: 16, weight: .medium))
                }
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text("C: \(history.fromBanka?.title ?? "")")
                        .foregroundColor(.cWhite)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    
                    Text("На: \(history.toBanka?.title ?? "")")
                        .foregroundColor(.cGray)
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(history.amount.toZero)\(userDefaults.currentCurrency)")
                        .foregroundColor(.cOrange)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    Text(history.date.toDBString())
                        .foregroundColor(.cGray)
                        .font(.system(size: 14, weight: .medium))
                }
            }
            .padding(.vertical, 4)
            
            RoundedRectangle(cornerRadius: 1)
                .fill(Color.cGray)
                .frame(height: 1)
                .opacity(0.7)
        }
        
    }
}
