//
//  MenuItemsView.swift
//  Little Lemon dinner menu
//
//  Created by Mohamed Aboullezz on 17/06/2023.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if viewModel.isShowFood {
                    MenuView(menuItems: viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                }
                if viewModel.isShowDrinks {
                    MenuView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                }
                if viewModel.isShowDesserts {
                    MenuView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                }
            }
            .onAppear(){
                viewModel.updateMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar {
                Button(action: {
                    viewModel.isOpenedOptionView.toggle()
                }, label: {
                    Image(systemName: "slider.vertical.3")
                })
            }
            .sheet(isPresented: $viewModel.isOpenedOptionView){
                NavigationStack{
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar{
                            Button("Done"){
                                viewModel.updateMenuItems()
                                viewModel.isOpenedOptionView.toggle()
                            }
                        }
                }
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
