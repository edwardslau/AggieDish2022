//
//  MenuView.swift
//  AggieDish
//
//  Created by Ruiyi He on 1/28/22.
//

import SwiftUI

struct MenuItem: View {
    var dishName: String
    var body: some View {
        VStack {
            VStack {
                Text(dishName)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        }
        .padding([.top, .horizontal])
        .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
    }
}

//struct MenuItemList: View {
//    var body: some View {
//        ScrollView {
//            ForEach(restaurants) { restaurant in
//                NavigationLink(destination: MenuView(restaurant: restaurant)) {
//                    Card(restaurant: restaurant)
//                }
//            }
//        }
//        .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
//    }
//}

struct MenuView: View {
    @State var isLinkActive = false
    var restaurant: Restaurant
    var body: some View {
        VStack{
            Image(restaurant.restaurantImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .ignoresSafeArea(edges: .top)
            Text(restaurant.restaurantName)
                .font(.title2.weight(.bold))
                .lineLimit(2)
                .padding([.top, .bottom], 2)
                .foregroundColor(.black)
            NavigationView {
                ScrollView {
                    MenuItem(dishName: "Burger")
                }
                .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
            
            
            NavigationLink(destination: CartView(),isActive: $isLinkActive) {
                Button(action: {
                    self.isLinkActive = true
                }){
                    Image("basket-icon")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .trailing)
                }
            }
            
            Spacer()
        }
        .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
        
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(restaurant: restaurants[0])
            .previewInterfaceOrientation(.portrait)
    }
}
