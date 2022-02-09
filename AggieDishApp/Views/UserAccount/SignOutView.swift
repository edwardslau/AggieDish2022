//
//  SignOutView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

import SwiftUI

struct SignOutView: View {
	@EnvironmentObject var user: UserAuthModel
	
	fileprivate func SignOutButton() -> some View {
		Button(action: {
			user.signOut()
		}){
			Text("Sign Out")
		}
		.padding(10)
		.background(Color.white)
		.foregroundColor(Color.black)
		.font(.body.weight(.bold))
		.overlay(
				RoundedRectangle(cornerRadius: 16)
					.stroke(Color.gray, lineWidth: 2)
			)
	}
	
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
						Text(user.givenName)
							.font(.title.weight(.bold))
						SignOutButton()
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
