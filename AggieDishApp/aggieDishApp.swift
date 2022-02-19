//
//  testApp.swift
//  test
//
//  Created by Ruiyi He on 1/24/22.
//

import SwiftUI

@main
struct aggieDishApp: App {
	@StateObject var user = UserAuthModel()
	
    var body: some Scene {
        WindowGroup {
            DefaultView()
				.environmentObject(user)
//            TestHomeView()
        }
    }
}
