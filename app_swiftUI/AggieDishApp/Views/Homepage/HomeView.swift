import SwiftUI

struct HomeView: View {
  @State private var showSortOptions = false
  @State private var filters: [FilterType: Bool] = [
    .diningCommons: false,
    .restaurants: false,
    .coffee: false,
    .silo: false,
  ]

  var body: some View {
    NavigationView {
      ZStack {
        VStack(alignment: .leading) {
          ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
              Group {
                Text("Hi, ") + Text("Guest").foregroundColor(Color.red) + Text(".")
              }
              .font(.title.weight(.bold))
              .lineLimit(1)

              Text("Welcome Back!")
                .font(.title.weight(.bold))
                .lineLimit(1)
                .padding(.bottom, 2)
              Text("Here are some options to get you started.\n")
                .font(.headline.weight(.medium))
              HStack {
                Text("On Campus Eats")
                  .font(.title2.weight(.bold))
                Spacer()
              }

            }
            .padding([.trailing, .leading, .top], 30)
          }
          .zIndex(1)
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              Filter(filterType: .diningCommons, filters: $filters)
              Filter(filterType: .restaurants, filters: $filters)
              Filter(filterType: .coffee, filters: $filters)
              Filter(filterType: .silo, filters: $filters)
            }
            .padding([.leading, .trailing])
          }
          CardList(filters: filters)
        }
        .background(Color("Background"))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
      }
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .previewInterfaceOrientation(.portrait)
  }
}