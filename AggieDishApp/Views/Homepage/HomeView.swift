//
//  HomeView.swift
//  test
//
//  Created by Ruiyi He on 1/27/22.
//

import SwiftUI

struct HomeView: View {
    @State private var showSortOptions = false
    
    var body: some View {
        NavigationView {
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
                            Button(
                                action: {
                                    self.showSortOptions.toggle()
                                }
                            ) {
                                Image(systemName: "line.3.horizontal.decrease")
                                    .font(Font.body.weight(.medium))
                                    .foregroundColor(Color.black)
                            }
                            
                        }
                        
                    }
                    .padding([.trailing, .leading, .top], 30)

                    
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Filter(type: "Dining Commons")
                        Filter(type: "Restaurants")
                        Filter(type: "Coffee")
                        Filter(type: "Silo")
                        
                    }
                    .padding([.leading, .trailing])
                }
                CardList()
                
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

func filter() {
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
