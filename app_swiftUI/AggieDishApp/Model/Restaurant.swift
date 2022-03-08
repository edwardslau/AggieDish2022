import Foundation
import SwiftUI

struct Restaurant: Hashable, Codable, Identifiable {
  var id: Int
  var restaurantImage: String
  var restaurantName: String
  var category: String
  var openHours: String
  var pickupLocation: String
  var location: String
  var expectPickupTime: String
  var description: String
}

var restaurants: [Restaurant] = load("restaurants.json")
func load<T: Decodable>(_ filename: String) -> T {

  guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
  else {
    fatalError("Couldn't find \(filename) in main bundle.")
  }

  let data: Data
  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }

  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}
