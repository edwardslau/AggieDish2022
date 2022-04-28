struct Ingredient {
  var name: String
}

struct Allergen {
  var name: String
}

struct FoodProduct: Identifiable {
  var id: String
  var name: String
  var price: String
  var customization: [Customization]
  var description: String
  var ingredients: [Ingredient]
  var allergens: [Allergen]
}
