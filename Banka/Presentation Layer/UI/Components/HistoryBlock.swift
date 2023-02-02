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
                VStack(alignment: .leading) {
                    Text(history.from)
                        .foregroundColor(.cWhite)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("+\(history.amount.toZero)\(userDefaults.currentCurrency)")
                        .foregroundColor(.green)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    Text(history.date)
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
                VStack(alignment: .leading) {
                    Text(history.from)
                        .foregroundColor(.cWhite)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    Text(history.category ?? "")
                        .foregroundColor(.cWhite)
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("-\(history.amount.toZero)\(userDefaults.currentCurrency)")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    Text(history.date)
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
                VStack(alignment: .leading) {
                    Text("C: \(history.from)")
                        .foregroundColor(.cWhite)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    
                    Text("На: \(history.to ?? "")")
                        .foregroundColor(.cWhite)
                        .font(.system(size: 14, weight: .medium))
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(history.amount.toZero)\(userDefaults.currentCurrency)")
                        .foregroundColor(.orange)
                        .font(.system(size: 16, weight: .black))
                        .padding(.bottom, 2)
                    Text(history.date)
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
