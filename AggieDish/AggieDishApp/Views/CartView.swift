//
//  CartView.swift
//  AggieDish
//
//  Created by YIZHEN LIU on 2/7/22.
//

import SwiftUI

struct CartItem: Identifiable, Hashable {
    var id = UUID()
    var pic: String
    var name: String
}

struct CartView: View {
    @State var isLinkActive = false
    @State var itemList = [
        CartItem(pic: "hand-made burger",name: "Hand-Made Burger"),
        CartItem(pic: "poke-bowl", name: "Poke Bowl")
    ]
        var body: some View {
            VStack{
                VStack{
                    Image("basket-icon")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                }
                ZStack {
                    NavigationView {
                        List {
                            ForEach(itemList) { item in
                                HStack {
                                    Image(item.pic)
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: .leading)
                                    Text(item.name)
                                    Spacer()
                                    Button(action: {self.delete(at:self.itemList.firstIndex(where: { $0.id == item.id })!)}){
                                        Image("remove-icon").resizable()
                                            .frame(width: 30, height: 30, alignment: .leading)
                                    }.foregroundColor(Color(.red))
                                }
                            }
                        }.navigationBarTitle("Your Cart")
                    }
                    .navigationTitle("Cart")
                    .navigationBarTitleDisplayMode(.inline)
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: WalletView(),isActive: $isLinkActive) {
                    Button(action: {
                        self.isLinkActive = true
                    }){
                        Text("Proceed to Checkout")
                            .font(.body.weight(.medium))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }.padding()
                    }
                    Spacer()
                }
            }
        }
    }
    func delete(at index: Int) {
        itemList.remove(at: index)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
