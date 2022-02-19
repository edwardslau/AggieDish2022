//
//  WalletView.swift
//  AggieDish
//
//  Created by Ruiyi He on 1/28/22.
//

import SwiftUI

struct WalletView: View {
    @State private var isEmpty: Bool = true
    
    var body: some View {
        if (isEmpty) {
            WalletEmptyView()
        } else {
            WalletNonEmptyView()
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
            .previewInterfaceOrientation(.portrait)
    }
}
