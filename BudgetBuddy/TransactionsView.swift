//
//  TransactionsView.swift
//  BudgetBuddy
//
//  Created by Janet Ahn on 2025-04-29.
//

import SwiftUI

struct TransactionView: View {
    @StateObject private var viewModel = BudgetViewModel()
    let categoryName: String

    var filteredTransactions: [Transaction] {
        viewModel.transactions.filter { $0.categoryName == categoryName }
    }

    var body: some View {
        List(filteredTransactions, id: \.id) { transaction in
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.title)
                    .font(.headline)
                HStack {
                    Text("$\(transaction.amount, specifier: "%.2f")")
                        .foregroundColor(.red)
                    Spacer()
                    Text(transaction.date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 4)
        }
        .navigationTitle(categoryName)
        .task {
            await viewModel.fetchTransactions()
        }
    }
}

#Preview {
    TransactionView(categoryName: "Food")
}
