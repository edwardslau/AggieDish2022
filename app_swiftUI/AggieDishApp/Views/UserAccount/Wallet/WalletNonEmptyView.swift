import SwiftUI

struct WalletNonEmptyView: View {
  @State var isLinkActive = false
  var body: some View {
    ZStack(alignment: .bottom) {

      List {
        HStack {
          Image("logo_mastercard")
            .resizable()
            .frame(width: 40, height: 30, alignment: .leading)
          Text("Card Ending with 1234")
          //                    NavigationLink(destination: OrderStatusView(),isActive: $isLinkActive) {
          Button(action: {
            self.isLinkActive = true
          }) {}
          .padding()
          //                    }
        }
        .padding()

        PaymentMethodListView()
      }
      HStack {
        Spacer()
        NavigationLink(destination: AddPaymentView(), isActive: $isLinkActive) {
          Button(action: {
            self.isLinkActive = true
          }) {
            Text("Add Payment Method")
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
    .navigationTitle("Saved Payment Method")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct PaymentMethodListView: View {
  var body: some View {
    HStack {
      Image("logo_visa")
        .resizable()
        .frame(width: 40, height: 15, alignment: .leading)
      Text("Card Ending with")
    }
    .padding()

    HStack {
      Image("logo_amex")
        .resizable()
        .frame(width: 40, height: 30, alignment: .leading)
      Text("Card Ending with")
    }
    .padding()
    HStack {
      Image("logo_aggiecash")
        .resizable()
        .frame(width: 100, height: 20, alignment: .leading)
    }
    .padding()
  }
}

struct WalletNonEmptyView_Previews: PreviewProvider {
  static var previews: some View {
    WalletNonEmptyView()
      .previewInterfaceOrientation(.portrait)
  }
}
