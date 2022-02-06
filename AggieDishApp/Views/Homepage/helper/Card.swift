//
//  Card.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

import SwiftUI

struct Card: View {
    var restaurant: Restaurant
    var body: some View {
        VStack (alignment: .leading) {
            VStack {
                VStack {
                    VStack (alignment: .leading){
                        ZStack(alignment: .topTrailing) {
                            Image(restaurant.restaurantImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(12)
                            HStack {
                                Image(systemName: "bag")
                                    .foregroundColor(Color.black)
                                    .padding([.top, .bottom], 7)
                                    .padding(.leading, 15)
                                Text (restaurant.expectPickupTime)
                                    .font(.subheadline.weight(.medium))
                                    .foregroundColor(.secondary)
                                    .padding(.trailing, 15)
                            }
                            .background(Color.white)
                            .cornerRadius(15)
                            .offset(x: -10.0, y: 10.0)
                        }
                        VStack (alignment: .leading){
                            Text (restaurant.restaurantName)
                                .font(.title2.weight(.bold))
                                .lineLimit(3)
                                .padding([.top, .bottom], 2)
                                .foregroundColor(.black)
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(Color.red)
                                    .padding([.trailing, .bottom], 1)
                                Text (restaurant.openHours)
                                    .font(.subheadline.weight(.medium))
                                    .foregroundColor(.secondary)
                            }
                            HStack {
                                Image(systemName: "map")
                                    .foregroundColor(Color.red)
                                    .padding(.trailing, 1)
                                Text (restaurant.location)
                                    .font(.subheadline.weight(.medium))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding([.leading, .trailing])

                    }
                    .padding()
                    .background(Color.white)
                }
                .cornerRadius(12)
                .padding([.top, .horizontal])
                .background(Color("Background"))
            }
        }
    }
}

struct CardList: View {
    var body: some View {
        ScrollView {
            ForEach(restaurants) { restaurant in
                NavigationLink(destination: MenuView(restaurant: restaurant)) {
//                isActive: $defaultPresenting
                    Card(restaurant: restaurant)
                }
            }
        }
        .background(Color("Background"))
    }
}
