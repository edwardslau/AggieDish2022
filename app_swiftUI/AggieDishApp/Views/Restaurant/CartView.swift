import SwiftUI

struct CartItem: Identifiable, Hashable {
  var id = UUID()
  var name: String
  var price: String
}

struct CartView: View {
  @State var isLinkActive = false
  @State var itemList = [
    CartItem(name: "Hand-Made Burger", price: "$9.99"),
    CartItem(name: "Poke Bowl", price: "$11.99"),
    CartItem(name: "Poke Bowl", price: "$11.99"),
    CartItem(name: "Poke Bowl", price: "$11.99"),
    CartItem(name: "Poke Bowl", price: "$11.99"),
    CartItem(name: "Poke Bowl", price: "$11.99"),
    CartItem(name: "Poke Bowl", price: "$11.99"),
    CartItem(name: "Poke Bowl", price: "$11.99"),

  ]
  var body: some View {
    ZStack(alignment: .bottom) {
      List {
        ForEach(itemList, id: \.self) { item in
          HStack {
            Text(item.name)
              .font(.system(size: 18))
            Spacer()
            Text(item.price)
              .font(.system(size: 18))
          }
        }.onDelete(perform: removeItem)
      }
      HStack {
        Spacer()
        NavigationLink(destination: WalletView(), isActive: $isLinkActive) {
          Button(action: {
            self.isLinkActive = true
          }) {
            Text("Proceed to Checkout")
              .font(.body.weight(.medium))
              .padding()
              .frame(maxWidth: .infinity)
              .background(Color.red)
              .foregroundColor(.white)
              .cornerRadius(15)
          }.padding()
        }
      }

    }
    .toolbar {
      EditButton()
    }
    .background(Color(".Background"))
    .navigationBarTitle("Your Cart")
    .navigationBarTitleDisplayMode(.inline)
  }

  func removeItem(at offsets: IndexSet) {
    itemList.remove(atOffsets: offsets)
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
  }
}
