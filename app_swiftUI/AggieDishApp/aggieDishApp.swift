import SwiftUI

@main
struct AggieDishApp: App {
	
  //let client = setupClient(host: "34.123.64.181", port: 8980)
 // let anotherClient = startClient(lat: 10, lng: 10)
	let eateries: () = getEatery(client: startClient(), lat: 10, lng: 10)

  @StateObject var user = UserAuthModel()
  var body: some Scene {
    WindowGroup {
      DefaultView()
        .environmentObject(user)
    }
  }
}
