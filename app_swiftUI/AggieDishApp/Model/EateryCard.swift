import Foundation
import SwiftUI

struct EateryCard: Identifiable {
//  TODO: paymentInfo, RatingInfo, ContactInfo
  var id: String
  var restaurantName: String
  var location: String
  var restaurantImage: String
  var dayOpen: [DayOpen]
  var menu: MenuModel
  var description: String
  var pickupLocation: String
  var category = ""
//  var openHours = ""
//  var expectPickupTime = ""

}

var eateries = getEatery(client: startClient(), lat: 10, lng: 10)
