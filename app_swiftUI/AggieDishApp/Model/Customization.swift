struct CustomizationChoice {
  var name: String
  var price: String
}

struct Customization {
  var category: String
  var minPick: Int32
  var maxPick: Int32
  var choices: [CustomizationChoice]
}
