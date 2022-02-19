//
//  SignOutView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

import SwiftUI

struct SignOutView: View {
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            Button(action: {},
                   label: {
                        HStack {
                            Image("google_logo")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding([.trailing])
                            Text("Sign in with Google")
                                .textCase(.uppercase)
                        }
                        .padding()
                    }
                )
                .padding(5)
                .background(Color.white)
                .cornerRadius(10)
                .foregroundColor(Color.blue)
                .font(.body.weight(.bold))
        }
        
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
            .previewInterfaceOrientation(.portrait)
    }
}
