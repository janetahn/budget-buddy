//
//  ContentView.swift
//  BudgetBuddy
//
//  Created by Janet Ahn on 2025-04-29.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BudgetViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.categoryNames, id: \.categoryName) { category in
                NavigationLink(destination: TransactionView(categoryName: category.categoryName)) {
                    HStack {
                        Text(category.categoryName)
                            .font(.headline)
                        Spacer()
                        Text("Limit: $\(category.limit, specifier: "%.2f")")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    .padding()
                }
            }
            .navigationTitle("Categories")
            .task {
                await viewModel.fetchCategories()
            }
        }
    }
}

#Preview {
    ContentView()
}
