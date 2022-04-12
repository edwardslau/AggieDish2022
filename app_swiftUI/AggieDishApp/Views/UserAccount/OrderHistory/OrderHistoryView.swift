import SwiftUI

struct OrderHistoryView: View {
  @State private var isEmpty = false

  var body: some View {
    if isEmpty {
      OrderHistoryEmptyView()
    } else {
      OrderHistoryNonEmptyView()
    }
  }
}

struct OrderHistoryView_Previews: PreviewProvider {
  static var previews: some View {
    OrderHistoryView()
      .previewInterfaceOrientation(.portrait)
  }
}
