//
//  HomeView.swift
//  test
//
//  Created by Ruiyi He on 1/27/22.
//

import SwiftUI

struct Restaurant: Decodable {
    let id: Int
    let restaurantImage: String
    let restaurantName: String
    let openHours: String
    let location: String
    let expectPickupTime: String
}

struct CardList: View {
    let restaurants: [Restaurant]

    init() {
        let url = Bundle.main.url(forResource: "restaurants", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        restaurants = try! JSONDecoder().decode([Restaurant].self, from: data)
    }


    var body: some View {
        ScrollView {
            ForEach(restaurants, id: \.id) { restaurant in
                Card(restaurant: restaurant)
            }
        }
        .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
        
    }
}

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
                    .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
                }
            }
    }
}

struct HomeView: View {
    var body: some View {
        VStack (alignment: .leading) {
            VStack (alignment: .leading) {
                Group {
                    Text("Hi, ") +
                    Text("Jane").foregroundColor(Color.red) +
                    Text(".")
                }
                .font(.title.weight(.bold))
                .lineLimit(1)

                Text("Welcome Back!")
                    .font(.title.weight(.bold))
                    .lineLimit(1)
                    .padding(.bottom, 2)
                Text("Here are some options to get you started.\n")
                    .font(.headline.weight(.medium))
                Text("On Campus Eats")
                    .font(.title2.weight(.bold))

            }
            .padding(30)

            CardList()
        }
        .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
