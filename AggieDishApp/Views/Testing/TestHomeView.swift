//
//  HomeView.swift
//  test
//
//  Created by Ruiyi He on 1/27/22.
//

import SwiftUI




struct TestHomeView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: TestView(restaurant: restaurants[0])) {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            
        }
    }
}

struct TestHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TestHomeView()
            .previewInterfaceOrientation(.portrait)
    }
}
