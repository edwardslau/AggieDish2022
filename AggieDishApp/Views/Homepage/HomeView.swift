//
//  HomeView.swift
//  test
//
//  Created by Ruiyi He on 1/27/22.
//

import SwiftUI

struct HomeView: View {
    @State private var showSortOptions = false
    @State private var filters = [false, false, false, false] // dc, restaurant, coffee, silo
    @StateObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack (alignment: .leading) {
                    ZStack (alignment: .topTrailing) {
                        VStack (alignment: .leading) {
                            Group {
                                Text("Hi, ") +
                                Text("Guest").foregroundColor(Color.red) +
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
                            HStack {
                                Text("On Campus Eats")
                                    .font(.title2.weight(.bold))
                                Spacer()
//                                Sort()
                                
                            }
                            
                        }
                        .padding([.trailing, .leading, .top], 30)
                        
                    }
                    .zIndex(1)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Filter(type: "Dining Commons", filters: $filters)
                            Filter(type: "Restaurants", filters: $filters)
                            Filter(type: "Coffee", filters: $filters)
                            Filter(type: "Silo", filters: $filters)
                        }
                        .padding([.leading, .trailing])
                    }
                    /* USAGE: read users' current location
//                    Text(getCoordinate(addressString:""))
//                    Text("location status: \(locationManager.statusString)")
//                                HStack {
//                                    Text("latitude: \(userLatitude)")
//                                    Text("longitude: \(userLongitude)")
//                                }
                     */

                    CardList(filters: filters)
                }
                .background(Color("Background"))
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            }
            
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
