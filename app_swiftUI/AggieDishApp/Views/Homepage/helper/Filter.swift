import Foundation
import SwiftUI

enum FilterType {
  case diningCommons
  case restaurants
  case coffee
  case silo
}

struct Filter: View {
  @State var isClicked = false
  var filterType: FilterType
  @Binding var filters: [FilterType: Bool]

  var body: some View {
    Button(action: {
      self.isClicked.toggle()
      filters.updateValue(self.isClicked, forKey: filterType)
    }) {
      switch filterType {
      case .diningCommons:
        Text("Dining Commons").foregroundColor(self.isClicked ? Color.white : Color.black)
      case .restaurants:
        Text("Restaurants").foregroundColor(self.isClicked ? Color.white : Color.black)
      case .coffee:
        Text("Coffee").foregroundColor(self.isClicked ? Color.white : Color.black)
      case .silo:
        Text("Silo").foregroundColor(self.isClicked ? Color.white : Color.black)
      }
    }
    .buttonStyle(.bordered)
    .background(self.isClicked ? Color.green : Color(UIColor.systemBackground))
    .cornerRadius(10)

  }
}
