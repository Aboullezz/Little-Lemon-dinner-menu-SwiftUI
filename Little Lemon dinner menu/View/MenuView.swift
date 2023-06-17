//
//  MenuView.swift
//  Little Lemon dinner menu
//
//  Created by Mohamed Aboullezz on 17/06/2023.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var viewModel: MenuViewModel
    
    var menuItems: [MenuItem]
    var menuCategory: MenuCategory
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    private var threeColumnGrid = [
        GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            HStack{
                Text(menuCategory.rawValue)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
            }
            LazyVGrid(columns: threeColumnGrid) {
                ForEach((menuItems),id: \.self) { menuItem in
                    NavigationLink(destination: MenuItemsDetailsView(menuItem: menuItem)) {
                        VStack{
                            Rectangle()
                            Text(menuItem.title)
                        }
                        .frame(height: 130)
                        .foregroundColor(.black)
                    }
                }
            }
            
        }
        .padding()
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewModel()
        MenuView(menuItems: viewModel.foods, menuCategory: .food)
    }
}
