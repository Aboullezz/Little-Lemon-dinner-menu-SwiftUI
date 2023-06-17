//
//  MenuViewModel.swift
//  Little Lemon dinner menu
//
//  Created by Mohamed Aboullezz on 17/06/2023.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    // Sample data foods
    @Published var foods: [MenuItem] = [
        MenuItem(price: 18.0, title: "Food 4", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce, .carrot, .pasta]),
        MenuItem(price: 10.0, title: "Food 5", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce]),
        MenuItem(price: 90.0, title: "Food 6", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce]),
        MenuItem(price: 20.0, title: "Food 7", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce, .spinach, .carrot]),
        MenuItem(price: 10.0, title: "Food 1", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce]),
        MenuItem(price: 15.0, title: "Food 2", menuCategory: .food, ordersCount: 15, ingredient: [.tomatoSauce, .pasta]),
        MenuItem(price: 25.0, title: "Food 3", menuCategory: .food, ordersCount: 20, ingredient: [.spinach, .broccoli]),
        MenuItem(price: 25.50, title: "Food 8", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce, .broccoli]),
        MenuItem(price: 10.0, title: "Food 9", menuCategory: .food, ordersCount: 10, ingredient: [.tomatoSauce]),
        MenuItem(price: 35.0, title: "Food 10", menuCategory: .food, ordersCount: 10, ingredient: [.spinach]),
        MenuItem(price: 45.0, title: "Food 11", menuCategory: .food, ordersCount: 10, ingredient: [.pasta]),
        MenuItem(price: 75.0, title: "Food 12", menuCategory: .food, ordersCount: 10, ingredient: [.carrot, .spinach])
    ]
    // Sample data drinks
    @Published var drinks: [MenuItem] = [
        MenuItem(price: 18.0, title: "Drink 4", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 5", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 1", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 15.0, title: "Drink 2", menuCategory: .drink, ordersCount: 15, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 3", menuCategory: .drink, ordersCount: 20, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 6", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 20.0, title: "Drink 7", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 25.0, title: "Drink 8", menuCategory: .drink, ordersCount: 10, ingredient: [])
    ]
    // Sample data desserts
    @Published var desserts: [MenuItem] = [
        MenuItem(price: 15.0, title: "Dessert 2", menuCategory: .dessert, ordersCount: 15, ingredient: []),
        MenuItem(price: 10.0, title: "Dessert 3", menuCategory: .dessert, ordersCount: 20, ingredient: []),
        MenuItem(price: 10.0, title: "Dessert 1", menuCategory: .dessert, ordersCount: 0, ingredient: []),
        MenuItem(price: 18.0, title: "Dessert 4", menuCategory: .dessert, ordersCount: 0, ingredient: [])
    ]
    
    @Published var isOpenedOptionView: Bool = false
    @Published var isShowFood: Bool = true
    @Published var isShowDrinks: Bool = true
    @Published var isShowDesserts: Bool = true
    
    @Published var sortBy = SortBy.fromAtoZ
    
    func updateMenuItems(){
        switch sortBy {
        case .mostPopular:
            foods.sort() { $0.ordersCount > $1.ordersCount }
            drinks.sort() { $0.ordersCount > $1.ordersCount }
            desserts.sort() { $0.ordersCount > $1.ordersCount }
            
        case .fromLowPrice:
            foods.sort() { $0.price < $1.price }
            drinks.sort() { $0.price < $1.price }
            desserts.sort() { $0.price < $1.price }
            
        case .fromAtoZ:
            foods.sort() { sortByTitle(lhs: $0, rhs: $1) }
            drinks.sort() { sortByTitle(lhs: $0, rhs: $1) }
            desserts.sort() { sortByTitle(lhs: $0, rhs: $1) }
        }
    }
    
    func sortByTitle(lhs: MenuItem, rhs: MenuItem) -> Bool {
        let lhsTitle = lhs.title.split(separator: " ")
        let rhsTitle = rhs.title.split(separator: " ")
        let lhsNumber = Int(lhsTitle[lhsTitle.count - 1]) ?? 0
        let rhsNumber = Int(rhsTitle[rhsTitle.count - 1]) ?? 0
        if lhsNumber != rhsNumber {
            return lhsNumber < rhsNumber
        } else {
            return lhs.title < rhs.title
        }
    }
}
