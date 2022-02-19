//
//  CartView.swift
//  AggieDish
//
//  Created by YIZHEN LIU on 2/7/22.
//

import SwiftUI

struct CartItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var price: String
}

struct CartView: View {
    @State var isLinkActive = false
    @State var itemList = [
        CartItem(name: "Hand-Made Burger", price: "$9.99"),
        CartItem(name: "Poke Bowl", price: "$11.99")
    ]
        var body: some View {
            VStack{
                VStack{
                    Image(systemName: "cart.fill")
                        .foregroundColor(Color(.systemRed))
                        .font(.system(size: 60))
                        .frame(width: 70, height: 70, alignment: .center)
                }
                ZStack {
                    NavigationView {
                        List {
                            ForEach(itemList) { item in
                                HStack {
                                    Text(item.name)
                                        .font(.system(size:15))
                                    Spacer()
                                    Text(item.price)
                                        .font(.system(size:15))
                                    Button(action: {self.delete(at:self.itemList.firstIndex(where: { $0.id == item.id })!)}){
                                        Image(systemName: "minus.circle.fill")
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
                }
                    Spacer()
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
