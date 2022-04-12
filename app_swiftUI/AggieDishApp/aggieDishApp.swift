import SwiftUI

@main
struct AggieDishApp: App {
	
  
	
  @StateObject var user = UserAuthModel()
  var body: some Scene {
    WindowGroup {
      DefaultView()
        .environmentObject(user)
    }
  }
}
