//
//  OrderHistoryView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

import SwiftUI

struct OrderHistoryView: View {
    @State private var isEmpty: Bool = false
    
    var body: some View {
        if (isEmpty) {
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
