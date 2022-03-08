import SwiftUI

struct UserSelectionsView: View {

  var body: some View {
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
