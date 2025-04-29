//
//  BudgetViewModel.swift
//  BudgetBuddy
//
//  Created by Janet Ahn on 2025-04-29.
//

import Foundation

class BudgetViewModel: ObservableObject {
    @Published var categoryNames: [Category] = []
    @Published var transactions: [Transaction] = []
    @Published var errorMessage: String?

    func fetchCategories() async {
        do {
            let apiResponse = try await getBudget()
            DispatchQueue.main.async {
                self.categoryNames = apiResponse.categories
            }
        } catch {
            print("Failed to load categories: \(error)")
        }
    }

    func fetchTransactions() async {
        do {
            let apiResponse = try await getBudget()
            DispatchQueue.main.async {
                self.transactions = apiResponse.transactions
            }
        } catch {
            print("Failed to load transactions: \(error)")
        }
    }

    private func getBudget() async throws -> APIResponse {
        let endpoint = "https://janetahn.github.io/fake-api/db.json"
        guard let url = URL(string: endpoint) else {
            throw BudgetError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw BudgetError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(APIResponse.self, from: data)
        } catch {
            throw BudgetError.invalidData
        }
    }
}

struct Transaction: Codable {
    let id: Int
    let title: String
    let amount: Double
    let categoryName: String
    let date: String
}

struct Category: Codable {
    let categoryName: String
    let limit: Double
}

struct APIResponse: Codable {
    let transactions: [Transaction]
    let categories: [Category]
}

enum BudgetError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
