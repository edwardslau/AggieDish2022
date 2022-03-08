import SwiftUI

struct WalletView: View {
  @State private var isEmpty = false
  var body: some View {
    if isEmpty {
      WalletEmptyView()
    } else {
      WalletNonEmptyView()
    }
  }
}
