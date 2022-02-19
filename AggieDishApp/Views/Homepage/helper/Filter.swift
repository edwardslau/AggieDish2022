//
//  Filter.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/5/22.
//

import Foundation
import SwiftUI

struct Filter: View {
    var type: String
    @State var isClicked : Bool = false
    @Binding var filters: [Bool] // dc, restaurant, coffee, silo
    
    var body: some View {
        Button(action: {
            self.isClicked.toggle()
            switch(type) {
                case "Dining Commons":
                    filters[0] = self.isClicked ? true : false
                case "Restaurants":
                    filters[1] = self.isClicked ? true : false
                case "Coffee":
                    filters[2] = self.isClicked ? true : false
                case "Silo":
                    filters[3] = self.isClicked ? true : false
                default:
                    break
            }
        }) {
            Text(type)
                .foregroundColor(self.isClicked == true ? Color.white : Color.black)
        }
        .buttonStyle(.bordered)
        .background(self.isClicked == true ? Color.green : Color(UIColor.systemBackground))
        .cornerRadius(10)
        
    }
}



//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        Filter(type: "Test")
//            .previewInterfaceOrientation(.portrait)
//    }
//}
