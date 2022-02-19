//
//  orderView.swift
//  AggieDish
//
//  Created by YIZHEN LIU on 2/14/22.
//

import SwiftUI

struct progressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemRed))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemRed))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}

struct orderView: View {
    @State var progressValue: Float = 0.2
    var body: some View {
        VStack {
                    progressBar(value: $progressValue).frame(height: 20)
                    Spacer()
                }.padding()
    }
}
struct orderView_Previews: PreviewProvider {
    static var previews: some View {
        orderView()
    }
}
