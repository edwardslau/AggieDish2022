import SwiftUI

struct Card: View {
  var eatery: EateryCard
  var body: some View {
    VStack(alignment: .leading) {
      VStack {
        VStack(alignment: .leading) {
          RestaurantImage(eatery: eatery)
          RestaurantInfo(eatery: eatery)
        }
        .padding()
        .background(Color.white)
      }
      .cornerRadius(12)
      .padding([.top, .horizontal])
      .background(Color("Background"))
    }
  }
}

struct RestaurantImage: View {
  var eatery: EateryCard
  var body: some View {
    ZStack(alignment: .topTrailing) {
      AsyncImage(url: URL(string: eatery.restaurantImage)) { image in
        image
          .resizable()
          .cornerRadius(12)
      } placeholder: {
        Image("placeholder")
          .resizable()
          .cornerRadius(12)
      }
      .frame(width: 320, height: 150)
      HStack {
        Image(systemName: "bag")
          .foregroundColor(Color.black)
          .padding([.top, .bottom], 7)
          .padding(.leading, 15)
        Text(eatery.expectPickupTime)
          .font(.subheadline.weight(.medium))
          .foregroundColor(.secondary)
          .padding(.trailing, 15)
      }
      .background(Color.white)
      .cornerRadius(15)
      .offset(x: -10.0, y: 10.0)
    }
  }
}

struct RestaurantInfo: View {
  var eatery: EateryCard
  var body: some View {
    VStack(alignment: .leading) {
      Text(eatery.restaurantName)
        .font(.title2.weight(.bold))
        .lineLimit(3)
        .padding([.top, .bottom], 2)
        .foregroundColor(.black)
      HStack {
        Image(systemName: "clock")
          .foregroundColor(Color.red)
          .padding([.trailing, .bottom], 1)
        Text(eatery.openHours)
          .font(.subheadline.weight(.medium))
          .foregroundColor(.secondary)
      }
      HStack {
        Image(systemName: "map")
          .foregroundColor(Color.red)
          .padding(.trailing, 1)
        Text(eatery.location)
          .font(.subheadline.weight(.medium))
          .foregroundColor(.secondary)
          .multilineTextAlignment(.leading)
      }
    }
    .padding([.leading, .trailing])
  }
}

struct CardList: View {
  var filters: [FilterType: Bool]
  var body: some View {
    ScrollView {
      ForEach(eateries) { eatery in
        NavigationLink(destination: MenuView(eatery: eatery)) {
          if !filters.values.contains(true)
            || (filters[.diningCommons] == true && eatery.category.contains("DC"))
            || (filters[.restaurants] == true && eatery.category.contains("Restaurants"))
            || (filters[.coffee] == true && eatery.category.contains("Coffee"))
            || (filters[.silo] == true && eatery.category.contains("Silo"))
          {
            Card(eatery: eatery)
          }
        }
      }
    }
    .background(Color("Background"))
  }
}
