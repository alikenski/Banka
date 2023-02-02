//
//  HistoryListScreen.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 02.12.2022.
//

import SwiftUI

struct HistoryListScreen: View {
    @StateObject var viewModel: HistoryVM = .init()
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.cBlack.ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                headerView
                Spacer()
                ScrollView {
                    LazyVStack(spacing: 4) {
                        ForEach(viewModel.historyList) { item in
                            HistoryBlock(history: item)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.updateHistoryList()
        }
    }
    
    var headerView: some View {
        HStack {
            Text("История")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.cWhite)
        }
    }
}
