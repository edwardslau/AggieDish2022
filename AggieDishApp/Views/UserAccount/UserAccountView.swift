//
//  UserAccountView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/4/22.
//
//  Google Sign-in: https://developers.google.com/identity/sign-in/ios/sign-in
//                  https://paulallies.medium.com/google-sign-in-swiftui-2909e01ea4ed

import SwiftUI
import GoogleSignIn

struct UserAccountView: View {
    
//    TODO: implement google login
    
    
//    let signInConfig = GIDConfiguration.init(clientID: "YOUR_IOS_CLIENT_ID")
    @State private var isLoggedIn: Bool = true
    
    var body: some View {
        if (isLoggedIn) {
            SignInView()
        } else {
            SignOutView()
        }
        
    }
}

struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountView()
            .previewInterfaceOrientation(.portrait)
    }
}

