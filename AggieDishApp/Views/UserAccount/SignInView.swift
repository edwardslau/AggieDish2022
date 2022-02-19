//
//  SignInView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

//
//  SignInView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//
import SwiftUI

struct SignInView: View {
	@EnvironmentObject var user: UserAuthModel
	
	fileprivate func SignInButton() -> some View {
		
		Button(action: {
			user.signIn()
		}){
			Image("google_logo")
				.resizable()
				.frame(width: 30, height: 30)
				.padding([.trailing])
			Text("Sign In With Google")
		}
		.padding()
		.background(Color.white)
		.foregroundColor(Color.blue)
		.font(.body.weight(.bold))
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
							Text("Guest")
								.font(.title.weight(.bold))
							HStack {
								SignInButton()
							}
							.overlay(
								RoundedRectangle(cornerRadius: 16)
									.stroke(Color.blue, lineWidth: 2)
							)
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

