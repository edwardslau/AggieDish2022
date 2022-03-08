import SwiftUI

struct Card: View {
  var restaurant: Restaurant
  var body: some View {
    VStack(alignment: .leading) {
      VStack {
        VStack(alignment: .leading) {
          RestaurantImage(restaurant: restaurant)
          RestaurantInfo(restaurant: restaurant)
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
  var restaurant: Restaurant
  var body: some View {
    ZStack(alignment: .topTrailing) {
      Image(restaurant.restaurantImage)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(12)
      HStack {
        Image(systemName: "bag")
          .foregroundColor(Color.black)
          .padding([.top, .bottom], 7)
          .padding(.leading, 15)
        Text(restaurant.expectPickupTime)
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
  var restaurant: Restaurant
  var body: some View {
    VStack(alignment: .leading) {
      Text(restaurant.restaurantName)
        .font(.title2.weight(.bold))
        .lineLimit(3)
        .padding([.top, .bottom], 2)
        .foregroundColor(.black)
      HStack {
        Image(systemName: "clock")
          .foregroundColor(Color.red)
          .padding([.trailing, .bottom], 1)
        Text(restaurant.openHours)
          .font(.subheadline.weight(.medium))
          .foregroundColor(.secondary)
      }
      HStack {
        Image(systemName: "map")
          .foregroundColor(Color.red)
          .padding(.trailing, 1)
        Text(restaurant.location)
          .font(.subheadline.weight(.medium))
          .foregroundColor(.secondary)
      }
    }
    .padding([.leading, .trailing])
  }
}

struct CardList: View {
  var filters: [FilterType: Bool]
  var body: some View {
    ScrollView {
      ForEach(restaurants) { restaurant in
        NavigationLink(destination: MenuView(restaurant: restaurant)) {
          if !filters.values.contains(true)
            || (filters[.diningCommons] == true && restaurant.category == "DC")
            || (filters[.restaurants] == true && restaurant.category == "Restaurants")
            || (filters[.coffee] == true && restaurant.category == "Coffee")
            || (filters[.silo] == true && restaurant.category == "Silo")
          {
            Card(restaurant: restaurant)
          }
        }
      }
    }
    .background(Color("Background"))
  }
}
