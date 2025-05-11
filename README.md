**BudgetBuddy** is a simple budgeting app built with **SwiftUI** and the **MVVM** architectural pattern. It displays a list of budget categories and allows users to view all transactions within each category.

This project was created to **practice SwiftUI layout, data fetching, navigation, and MVVM design principles**.

---

## Features

- List of budget categories with spending limits
- Tap a category to view its transactions
- Real-time data fetching using `URLSession` and async/await
- Modular architecture using MVVM
- Clean UI built entirely with SwiftUI

---

## Architecture

This app follows the **Model-View-ViewModel (MVVM)** pattern:

- **Model**: `Transaction` and `Category` structs conform to `Codable` and represent the data layer.
- **ViewModel**: `BudgetViewModel` handles data fetching and exposes observable properties to the view.
- **View**: SwiftUI views (`ContentView`, `TransactionView`) present the data and bind directly to the `@Published` properties in the ViewModel.

---

### Data Source

The app uses a sample JSON file hosted on GitHub Pages to simulate API responses. You can view it here:

🔗 [View JSON data](https://janetahn.github.io/fake-api/db.json)

The JSON includes:

- An array of **categories**, each with a name and spending limit.
- An array of **transactions**, each linked to a category.

---

## How to:

To run the project:

1. Clone the repository.
2. Open `BudgetBuddy.xcodeproj` in Xcode.
3. Run on a simulator or real device with iOS 15 or later.

---

## Future Improvements

- Add progress bars to show how much of the budget is spent.
- Include transaction search and filtering.
- Support editing and deleting transactions.
- Persist user data with local storage or Core Data.
