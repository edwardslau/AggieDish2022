//
//  CardView.swift
//  test
//
//  Created by Ruiyi He on 1/27/22.
//

import SwiftUI

struct CardView: View {
    var restaurantImage: String
    var restaurantName: String
    var openHours: String
    var location: String
    var expectPickupTime: String
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){
                ZStack(alignment: .topTrailing) {
                    Image(restaurantImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                    HStack {
                        Image(systemName: "bag")
                            .foregroundColor(Color.black)
                            .padding([.top, .bottom], 7)
                            .padding(.leading, 15)
                        Text (expectPickupTime)
                            .font(.subheadline.weight(.medium))
                            .foregroundColor(.secondary)
                            .padding(.trailing, 15)
                    }
                    .background(Color.white)
                    .cornerRadius(15)
                    .offset(x: -10.0, y: 10.0)
                }
                VStack (alignment: .leading){
                    Text (restaurantName)
                        .font(.title2.weight(.bold))
                        .lineLimit(3)
                        .padding([.top, .bottom], 2)
                    HStack {
                        Image(systemName: "clock")
                            .foregroundColor(Color.red)
                            .padding([.trailing, .bottom], 1)
                        Text (openHours)
                            .font(.subheadline.weight(.medium))
                            .foregroundColor(.secondary)
                    }
                    HStack {
                        Image(systemName: "map")
                            .foregroundColor(Color.red)
                            .padding(.trailing, 1)
                        Text (location)
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
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
            ScrollView {
                VStack {
                    CardView(restaurantImage: "tercero_dining", restaurantName: "Tercero Dining Commons", openHours: "9am - 6pm", location: "First Floor", expectPickupTime: "10 to 15 min")
                    CardView(restaurantImage: "tercero_dining", restaurantName: "Tercero Dining Commons", openHours: "9am - 6pm", location: "First Floor", expectPickupTime: "10 to 15 min")
                    CardView(restaurantImage: "tercero_dining", restaurantName: "Tercero Dining Commons", openHours: "9am - 6pm", location: "First Floor", expectPickupTime: "10 to 15 min")
                    CardView(restaurantImage: "tercero_dining", restaurantName: "Tercero Dining Commons", openHours: "9am - 6pm", location: "First Floor", expectPickupTime: "10 to 15 min")
                    
                }
            }
        }
        .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
        
.previewInterfaceOrientation(.portrait)
       
        
    }
}
