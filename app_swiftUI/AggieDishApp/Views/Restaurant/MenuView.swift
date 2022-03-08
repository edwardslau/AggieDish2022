import SwiftUI

struct MenuItem: View {
  var dishName: String
  var price: String
  var body: some View {
    HStack {
      Text(dishName)
      Spacer()
      Text(price)
      // Button for adding to cart
      Button {
      } label: {
        Image(systemName: "plus.circle").foregroundColor(Color(.systemRed))
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.white)
  }
}

struct MenuItemList: View {
  var body: some View {
    VStack(alignment: .leading) {
      MenuItem(dishName: "Burger", price: "$9.99")
      MenuItem(dishName: "Burger2", price: "$9.99")
      MenuItem(dishName: "Burger3", price: "$9.99")
      MenuItem(dishName: "Burger4", price: "$9.99")
      MenuItem(dishName: "Burger5", price: "$9.99")
      MenuItem(dishName: "Burger6", price: "$9.99")
      MenuItem(dishName: "Burger7", price: "$9.99")
      MenuItem(dishName: "Burger8", price: "$9.99")
      MenuItem(dishName: "Burger9", price: "$9.99")
    }
  }
}

struct HeroImage: View {
  var restaurant: Restaurant

  var body: some View {
    Image(restaurant.restaurantImage)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .brightness(-0.2)
      .padding([.bottom], 10)
  }
}

struct InfoView: View {
  var restaurant: Restaurant

  var body: some View {
    VStack(alignment: .leading) {
      Divider()
      Text(restaurant.description)
        .padding()
      Divider()
      HStack {
        Image(systemName: "location")
          .padding()
          .font(Font.body.weight(.medium))
        Text(restaurant.location)
      }
      .padding()
      Divider()
      HStack {
        Image(systemName: "clock")
          .padding()
          .font(Font.body.weight(.medium))
        Text(restaurant.openHours)
      }
      .padding()
    }
  }
}

struct MenuView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @State var isLiked = false
  @State var isExpanded = false

  var restaurant: Restaurant

  var body: some View {
    ScrollView {
      // Restaurant picture
      ZStack(alignment: .bottomTrailing) {
        HeroImage(restaurant: restaurant)
        CountdownView(countTo: 60 * 7)
          .offset(x: -120.0, y: 0.0)
      }
      .frame(minHeight: 300, maxHeight: 300)
      // Detail info
      VStack(alignment: .leading) {
        DisclosureGroup(
          isExpanded: $isExpanded,
          content: {
            InfoView(restaurant: restaurant)
          },
          label: {
            Text("Hours, Location & Description")
              .foregroundColor(Color.black)
              .font(.body.weight(.semibold))
              .padding()
          }
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.leading, .trailing])
      }
      .background(Color.white)
      // List of Items
      MenuItemList()
    }
    .ignoresSafeArea(edges: .top)
    .background(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(
      leading:
        HStack {
          Button(
            action: {
              self.mode.wrappedValue.dismiss()
            }
          ) {
            Image(systemName: "chevron.backward")
              .foregroundColor(Color.white)
              .font(Font.body.weight(.medium))
          }
          Text(abbreviateDCName(restaurantName: restaurant.restaurantName))
            .font(.title2.weight(.bold))
            .foregroundColor(Color.white)

        },
      trailing:
        HStack {
          Button(action: {
            self.isLiked.toggle()
          }) {
            Image(systemName: self.isLiked == true ? "heart.fill" : "heart")
              .foregroundColor(self.isLiked == true ? Color.red : Color.white)
              .font(Font.body.weight(.semibold))
          }
          NavigationLink(destination: CartView()) {
            Image(systemName: "cart")
              .foregroundColor(Color.blue)
              .font(Font.body.weight(.semibold))
          }
        }
    )
  }
}

func abbreviateDCName(restaurantName: String) -> String {
  if restaurantName.contains("Dining Common") {
    let endOfSentence = restaurantName.index(of: "Dining Common")!
    let newRestaurantName = String(restaurantName[..<endOfSentence]) + "DC"
    return newRestaurantName
  }
  return restaurantName
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView(restaurant: restaurants[0])
      .previewInterfaceOrientation(.portrait)
  }
}
