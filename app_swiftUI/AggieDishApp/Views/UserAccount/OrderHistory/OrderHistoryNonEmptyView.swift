import SwiftUI

struct OrderHistoryNonEmptyView: View {
  var body: some View {
    VStack {
      List {
        OrderHistoryCard(
          restaurantName: "Tercero Dining Common", restaurantImage: "dining_commons",
          orderItems: ["Dish1", "Dish2", "Dish3"], orderSubtotal: 15.60, orderDate: "Feb 6")
        OrderHistoryCard(
          restaurantName: "Segundo Dining Common", restaurantImage: "dining_commons",
          orderItems: ["Dish3"], orderSubtotal: 5.09, orderDate: "Feb 5")
        OrderHistoryCard(
          restaurantName: "Latitude", restaurantImage: "latitude", orderItems: ["Dish1", "Dish2"],
          orderSubtotal: 10.19, orderDate: "Feb 3")
      }
    }
    .navigationTitle("Order History")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct OrderHistoryCard: View {
  var restaurantName: String
  var restaurantImage: String
  var orderItems: [String]
  var orderSubtotal: Double
  var orderDate: String

  var body: some View {
    HStack {
      Image(restaurantImage)
        .resizable()
        .frame(width: 80, height: 80)
        .padding([.top, .bottom])
      VStack(alignment: .leading) {
        Text(orderDate)
          .font(.body.weight(.semibold))
        Text(restaurantName)
          .font(.title3.weight(.semibold))
          .lineLimit(2)
        HStack {
          Text(String(orderItems.count) + " items")
            .foregroundColor(.secondary)
          Text("$" + String(orderSubtotal))
        }
      }
      .padding()
    }
  }
}

struct OrderHistoryNonEmptyView_Previews: PreviewProvider {
  static var previews: some View {
    OrderHistoryNonEmptyView()
      .previewInterfaceOrientation(.portrait)
  }
}
