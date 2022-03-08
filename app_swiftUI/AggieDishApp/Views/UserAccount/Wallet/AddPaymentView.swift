import SwiftUI

struct AddPaymentView: View {
  @State var cardNumber = NumbersOnly()
  @State var expirationDate = NumbersOnly()
  @State var CSC = NumbersOnly()
  @State var cardHolder: String = ""
  @State var isLinkActive = false
  var body: some View {
    VStack {
      Spacer()
      VStack(alignment: .leading) {
        Text("Card Number:")
        VStack {
          TextField("xxxx xxxx xxxx xxxx", text: $cardNumber.value)
        }.textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.decimalPad)
      }.padding()
      HStack {
        Text("Expiration Date")
        VStack {
          TextField("xx/xx", text: $expirationDate.value)
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.decimalPad)

        Text("Secuirty Code")
        VStack {
          TextField("xxx", text: $CSC.value)
        }.textFieldStyle(RoundedBorderTextFieldStyle())
      }.padding()
      VStack(alignment: .leading) {
        Text("Card Holder Name: \(cardHolder)")
        VStack {
          TextField("JOHN DOE", text: $cardHolder)
        }.textFieldStyle(RoundedBorderTextFieldStyle())
          .keyboardType(.decimalPad)
      }.padding()
      Spacer()
      NavigationLink(destination: WalletNonEmptyView(), isActive: $isLinkActive) {
        Button(action: {
          self.isLinkActive = true
        }) {
          Text("Add to Wallet")
            .font(.body.weight(.medium))
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(15)
        }.padding()
      }
    }
  }
}
class NumbersOnly: ObservableObject {
  @Published var value = "" {
    didSet {
      let filtered = value.filter { $0.isNumber }

      if value != filtered {
        value = filtered
      }
    }
  }
}
struct AddPaymentView_Previews: PreviewProvider {
  static var previews: some View {
    AddPaymentView()
  }
}
