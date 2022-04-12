import SwiftUI
import ExytePopupView



struct CustomizationPopupView: View {
  let popupColor = Color.white
  @Binding var isPresented: Bool
  @State var isExpanded: Bool = false
  
  var dishName: String
  var price: Double
  
  mutating func updatePrice(changeBy: Double) {
    self.price += changeBy
  }
  
  func addToCart() {
    itemsInCart.append(CartItem(name: dishName, price: price))
//    cartItems.append(CartItem(name: dishName, price: price))
  }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {
                isPresented = false
            }, label: {
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 32, height: 32)
                    .background(Color.black.opacity(0.06))
                    .cornerRadius(16)
                    .foregroundColor(.black)
            })
            .padding()
            .zIndex(1)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    DishInfoView(dishName: dishName)

                    // example customization choices
                    CustomizationBox(category: "Select", isOptional: true)

                    VStack(alignment: .leading) {
                        Text("Extra")
                            .font(.title3.weight(.semibold))
                        Group {
                            CustomizationSelection(optionName: "Extra Lettuce", price: 1.25, isOptional: true)
                            Divider()
                            CustomizationSelection(optionName: "Extra Cheese", price: 2, isOptional: true)
                        }
                    }
                    .padding()
                    VStack(alignment: .leading) {
                        Text("Select a Side")
                            .font(.title3.weight(.semibold))
                        Group {
                            CustomizationSelection(optionName: "French Fries", price: 0, isOptional: false)
                            Divider()
                            CustomizationSelection(optionName: "Curly Fries", price: 1.2, isOptional: false)
                        }
                    }
                    .padding()
                    CustomizationBox(category: "Select", isOptional: true)


                    Spacer()
                    VStack(alignment: .center) {
                        EditNumberAddToCart()
                        HStack {
                            Button(action: {
                              isPresented = false
                              addToCart()
                            }, label: {
                                Text("Add to Cart")
                                    .font(.body.weight(.medium))
                                    .padding()
                                Spacer()
                              Text("$"+String(format: "%.2f",price))
                                    .font(.body.weight(.medium))
                                    .padding()
                            })
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        }
                    }
                }
                .padding()

            }
            .padding(EdgeInsets(top: 70, leading: 20, bottom: 40, trailing: 20))
            .frame(width: 350, height: 600)
            .background(self.popupColor)
            .cornerRadius(10.0)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        }

    }
}

struct DishInfoView: View {
  @State var isExpanded: Bool = false
  var dishName: String

  var body: some View {
      Text(dishName)
          .font(.title.weight(.bold))
          .padding([.bottom])
      Text("description")
          .multilineTextAlignment(.center)
      Divider()
      DisclosureGroup(
          isExpanded: $isExpanded,
          content: {
              VStack (alignment: .leading){
                  Text("list of ingredients").padding()
              }
          },
          label: {
              Text("Ingredients")
                  .foregroundColor(Color.black)
                  .font(.body.weight(.semibold))
          }
      )
      Divider()
  }
}

struct CustomizationBox: View {
    var category: String
    var isOptional: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .font(.title3.weight(.semibold))
            Group {
                CustomizationSelection(optionName: "Add Lettuce", price: 0, isOptional: isOptional)
                Divider()
                CustomizationSelection(optionName: "Add Cheese", price: 0, isOptional: isOptional)
            }
        }
        .padding()
    }
}
