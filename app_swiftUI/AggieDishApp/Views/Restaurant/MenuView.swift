import SwiftUI
import ExytePopupView

public var popUpDish = ""
public var popUpPrice = 0.0

struct MenuItem: View {
  @Binding var showing: Bool
  var dishName: String
  var price: Double
  var update: (String, Double)->()

  var body: some View {
      Button {
        update(dishName, price)
        popUpDish = dishName
        popUpPrice = price
        showing.toggle()
      } label: {
        VStack (alignment: .leading) {
          HStack {
            Text(dishName)
              .foregroundColor(.black)
              .font(Font.headline.weight(.medium))
            Spacer()
          }
          .padding([.bottom], 3)
          HStack {
            Text("$"+String(format: "%.2f",price))
              .foregroundColor(.black)
            Spacer()
          }
        }
        .contentShape(Rectangle())
        .padding()
        .padding([.leading])
      }
  }
}

struct HeroImage: View {
  var eatery: EateryCard

  var body: some View {
    AsyncImage(url: URL(string: eatery.restaurantImage)) { image in
      image
        .resizable()
        .brightness(-0.2)
    } placeholder: {
      Image("placeholder")
        .resizable()
        .brightness(-0.2)
    }
    .frame(width: 400, height: 300)
  }
}

struct InfoView: View {
  var eatery: EateryCard

  var body: some View {
    VStack(alignment: .leading) {
      Divider()
      Text(eatery.description)
        .padding()
      Divider()
      HStack {
        Image(systemName: "location")
          .padding()
          .font(Font.body.weight(.medium))
        Text(eatery.location)
      }
      .padding()
      Divider()
      HStack {
        Image(systemName: "clock")
          .padding()
          .font(Font.body.weight(.medium))
//        Text(eatery.openHours)
        Text("open hours")
      }
      .padding()
    }
  }
}

struct ScheduleView: View {
  func getFutureDates() -> [String] {
    var datesNextWeek: [String] = ["Today"]
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, d MMM"
    for i in 1...5 {
      let modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: Date.now)!
      datesNextWeek.append(dateFormatter.string(from: modifiedDate))
    }
    return datesNextWeek
  }

  @State var value = ""
  var placeholder = "Today"
  var dropDownList: [String] = []

  init() {
    self.dropDownList = getFutureDates()
  }

  var body: some View {
    Menu {
      ForEach(dropDownList, id: \.self) { client in
        Button(client) {
          self.value = client
        }
      }
    } label: {
      VStack {
        HStack {
          Text(value.isEmpty ? placeholder : value)
            .foregroundColor(.black)
            .font(.body.weight(.semibold))
          Spacer()
          Text("CHANGE")
        }
        .padding(.horizontal)
      }
    }
  }
}


struct MenuView: View {
  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @State var isLiked = false
  @State var isExpanded = false

  var eatery: EateryCard

  var body: some View {
    ScrollView {
      // Restaurant picture
      ZStack(alignment: .bottomTrailing) {
        HeroImage(eatery: eatery)
        CountdownView(countTo: 60 * 7)
          .offset(x: -20.0, y: 0.0)
      }
      .frame(minHeight: 300, maxHeight: 300)
      // Detail info
      VStack(alignment: .leading) {
        DisclosureGroup(
          isExpanded: $isExpanded,
          content: {
            InfoView(eatery: eatery)
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
        Divider()
        ScheduleView()
          .padding()
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
          Text(abbreviateDCName(restaurantName: eatery.restaurantName))
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

struct MenuItemList : View {
  let bgColor = Color(.white)
  @State var showingPopup = false
  @State var showingPopupDishName: String = ""
  @State var showingPopupPrice: Double = 0
//  @State var cartItems: [CartItem]

  func update (dishName: String, price: Double) {
    self.showingPopup = false
    self.showingPopupDishName = dishName
    self.showingPopupPrice = price
  }

  var body: some View {
    ZStack {
      bgColor
      VStack(alignment: .leading, spacing: 15) {
        MenuItem(showing: $showingPopup, dishName: "Burger", price: 9.8, update: update)
        Divider()
        MenuItem(showing: $showingPopup, dishName: "Burger2", price: 9.8, update: update)
        Divider()
        MenuItem(showing: $showingPopup, dishName: "Burger3", price: 9.8, update: update)
        Divider()
        MenuItem(showing: $showingPopup, dishName: "Burger4", price: 9.8, update: update)
      }
    }
    .popup(isPresented: $showingPopup, type: .`default`, position: .bottom, closeOnTap: false) {
      CustomizationPopupView(isPresented: $showingPopup, dishName: popUpDish, price: popUpPrice)
    }
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
