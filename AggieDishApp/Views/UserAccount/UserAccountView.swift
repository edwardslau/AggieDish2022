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
	
	@EnvironmentObject var user: UserAuthModel
    
    var body: some View {
		if (user.isLoggedIn) {
			SignOutView().environmentObject(user)
        } else {
			SignInView().environmentObject(user)
        }
	}
}

struct UserAccountView_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountView()
            .previewInterfaceOrientation(.portrait)
    }
}
