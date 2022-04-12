import SwiftUI
import Combine

//var CartTest = ShoppingCart()
//func triggerCartActions(_ actions: CartAction...) {
//    Publishers.Sequence<[CartAction], Never>(sequence: actions)
//      .receive(subscriber: CartTest.input)
//}
//
//func test() {
//  let apple = CartItem(id: 1, name: "🍎", price: 5.0)
////  CartTest.input.insert
//  triggerCartActions(.insert(product: apple))
//}



struct CartView: View {
  @State var isLinkActive = false
//  @State var CartItems: [CartItem] = []
  @State var count: Int = 1     //should be item.count
  
  var body: some View {
    
    ZStack(alignment: .bottom) {
      ScrollView {
        ForEach(itemsInCart, id: \.self) { item in
          CartItemsView(onDelete: removeItem, item: item)
        }
        .onDelete(perform: removeItem)
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
//    itemsInCart.remove(atOffsets: offsets)
    withAnimation {
      itemsInCart.remove(atOffsets: offsets)
    }
  }
}

struct CartItemsView: View {
//  var cartItems: [CartItem]
  let onDelete: (IndexSet) -> ()
//  var index: Int
  var item: CartItem
  
  @State var count: Int = 1     //should be item.count
  var body: some View {
    ZStack {
      HStack {
        VStack (alignment: .leading) {
//          Text(itemsInCart[index].name)
          Text(item.name)
            .font(.title3.weight(.medium))
          Text("customization options selected")
            .foregroundColor(.secondary)
            .frame(width: 200, alignment: .leading)
            .multilineTextAlignment(.leading)
          Text("$"+String(format: "%.2f",item.price))
        }
        Spacer()
      }
      HStack {
        Spacer()
        Button(action: {
            count = count > 1 ? count - 1 : 1
        }, label: {
          Image(systemName: "minus.circle").foregroundColor(Color(.systemRed))
        })
        Text(String(count))
            .frame(minWidth: 50)
        Button(action: {
            count += 1
        }, label: {
          Image(systemName: "plus.circle").foregroundColor(Color(.systemRed))
        })
        Button(action: {
//          itemsInCart.remove(at: index)
//          itemsInCart.remove(atOffsets: indexSet)
//          self.onDelete(IndexSet(integer: index))
          if let index = itemsInCart.firstIndex(of: item) {
              self.onDelete(IndexSet(integer: index))
          }
        }, label: {
          Image(systemName: "trash.fill").foregroundColor(Color(.black))
        })
      }
      .zIndex(1)
    }
    .padding()
  }
}









