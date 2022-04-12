import SwiftUI

struct OrderHistoryEmptyView: View {
  var body: some View {
    ZStack {
      VStack {
        Image(systemName: "cart")
          .resizable()
          .frame(width: 100, height: 100)
          .opacity(0.1)
        Text("No orders yet")
          .font(.title2.weight(.semibold))
          .padding()
      }
      .offset(y: -100)
    }
    .navigationTitle("Order History")
    .navigationBarTitleDisplayMode(.inline)
  }
}
