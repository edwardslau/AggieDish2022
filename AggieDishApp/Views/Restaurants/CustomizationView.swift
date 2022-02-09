//
//  CustomizationView.swift
//  AggieDish
//
//  Created by Ruiyi He on 1/29/22.
//

import SwiftUI

struct CustomizationView: View {
//    var restaurant: Restaurant
    var body: some View {
        NavigationView {
            ScrollView {
//                Image(restaurant.restaurantImage)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .ignoresSafeArea(edges: .top)
//                Text(restaurant.restaurantName)
//                    .font(.title2.weight(.bold))
//                    .lineLimit(2)
//                    .padding([.top, .bottom], 2)
//                    .foregroundColor(.black)
//                MenuItem(dishName: "Burger")
            }
            .background(Color("Background"))
        }
        .navigationTitle("Customize Item")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CustomizationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizationView()
            .previewInterfaceOrientation(.portrait)
    }
}

