import Foundation
import SwiftUI


struct EateryCard: Identifiable {
  var id = 0
  var restaurantImage = ""
  var restaurantName = ""
  var category = ""
  var openHours = ""
  var pickupLocation = ""
  var location = ""
  var expectPickupTime = ""
  var description = ""
}

var eateries = getEatery(client: startClient(), lat: 10, lng: 10)
