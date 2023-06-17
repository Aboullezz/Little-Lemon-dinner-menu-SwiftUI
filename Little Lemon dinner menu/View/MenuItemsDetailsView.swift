//
//  MenuItemsDetailsView.swift
//  Little Lemon dinner menu
//
//  Created by Mohamed Aboullezz on 17/06/2023.
//

import SwiftUI

struct MenuItemsDetailsView: View {
    var menuItem: MenuItem
    var body: some View {
        NavigationStack{
            Image("Little Lemon logo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            
            if menuItem.price > 0 {
                VStack{
                    Text("Price: ")
                        .fontWeight(.bold)
                    Text(String(format: "%.2f", menuItem.price))
                }
                .padding(1)
            }
            if menuItem.ordersCount > 0 {
                VStack{
                    Text("Ordered: ")
                        .fontWeight(.bold)
                    Text("\(menuItem.ordersCount)")
                }
                .padding(1)
            }
            if menuItem.ingredient.count > 0 {
                VStack{
                    Text("Ingredient")
                        .fontWeight(.bold)
                    ForEach(menuItem.ingredient,id: \.self){
                        Text($0.rawValue)
                    }
                }
                .padding(1)
            }
        }
        .navigationTitle(menuItem.title)
        .padding([.leading,.trailing],60)
    }
}

struct MenuItemsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let menuItem = MenuItem(price: 10, title: "Food 1", menuCategory: .food, ordersCount: 15, ingredient: [.tomatoSauce])
        MenuItemsDetailsView(menuItem: menuItem)
    }
}
