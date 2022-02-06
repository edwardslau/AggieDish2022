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
    
    var body: some View {
        Button(action: {
           self.isClicked.toggle()
        }) {
            Text(type)
                .foregroundColor(self.isClicked == true ? Color.white : Color.black)
        }
        .buttonStyle(.bordered)
        .background(self.isClicked == true ? Color.green : Color(UIColor.systemBackground))
        .cornerRadius(10)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        Filter(type: "Test")
            .previewInterfaceOrientation(.portrait)
    }
}
