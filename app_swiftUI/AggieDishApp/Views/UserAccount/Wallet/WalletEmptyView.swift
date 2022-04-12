import SwiftUI

struct WalletEmptyView: View {
  var body: some View {
    ZStack(alignment: .bottom) {
      ZStack {
        VStack {
          Image(systemName: "note.text")
            .resizable()
            .frame(width: 100, height: 100)
            .opacity(0.1)
          Text("No records yet")
            .font(.title2.weight(.semibold))
            .padding()
          Text("Hit the button below to Add a payment method")
            .opacity(0.2)
            .multilineTextAlignment(.center)
            .frame(width: 180, alignment: .center)
        }
        .offset(y: -100)

        NavigationButtonView()
          .padding()
      }
      .navigationTitle("Saved Payment Method")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct NavigationButtonView: View {
  var body: some View {
    NavigationLink(destination: AddPaymentView()) {
      Text("Add Payment Method")
        .font(.body.weight(.medium))
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .foregroundColor(.white)
        .cornerRadius(15)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
  }
}
