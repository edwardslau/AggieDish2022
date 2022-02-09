//
//  SignInView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

import SwiftUI

struct SignInView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("default_profile")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color.yellow, lineWidth: 5))
                    VStack {
                        Text("User Name")
                            .font(.title.weight(.bold))
                        Button(action: {},
                               label: {Text("Sign Out")
                                .padding([.leading, .trailing])
                                .textCase(.uppercase)
                        })
                            .buttonStyle(.bordered)
                            .foregroundColor(Color.blue)
                            .font(.body.weight(.bold))
                        
                    }
                    .padding([.leading])
                    
                }
                .padding()
                
                
                List {
                    NavigationLink(destination: WalletView()) {
                        HStack {
                            Image(systemName: "creditcard")
                                .padding([.trailing])
                            Text("Saved Payment Method")
                                .font(.body.weight(.semibold))
                        }
                        .padding()
                    }
                    NavigationLink(destination: OrderHistoryView()) {
                        HStack {
                            Image(systemName: "clock")
                                .padding([.trailing])
                            Text("Order History")
                                .font(.body.weight(.semibold))
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .previewInterfaceOrientation(.portrait)
    }
}


