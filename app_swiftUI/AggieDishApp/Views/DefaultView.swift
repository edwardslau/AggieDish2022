import SwiftUI

struct DefaultView: View {
  @State private var defaultPresenting: Bool = false

  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }
      UserAccountView()
        .tabItem {
          Image(systemName: "person")
          Text("Account")
        }
    }
  }
}

struct DefaultView_Previews: PreviewProvider {
  static var previews: some View {
    DefaultView()
      .previewInterfaceOrientation(.portrait)
  }
}
