//
//  MenuView.swift
//  AggieDish
//
//  Created by Ruiyi He on 1/28/22.
//

import SwiftUI

struct TestView: View {
    var restaurant: Restaurant
    var body: some View {
        VStack {
           
        }
        .navigationTitle("Order History")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(restaurant: restaurants[0])
            .previewInterfaceOrientation(.portrait)
    }
}
