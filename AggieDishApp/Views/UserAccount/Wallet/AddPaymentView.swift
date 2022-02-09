//
//  AddPaymentView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

import SwiftUI

struct AddPaymentView: View {
    var body: some View {
        VStack {
            Text("Add payment method")
        }
        .navigationTitle("Add Payment Method")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        AddPaymentView()
            .previewInterfaceOrientation(.portrait)
    }
}

