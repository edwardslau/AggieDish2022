//
//  OrderStatusView.swift
//  AggieDish
//
//  Created by YIZHEN LIU on 2/15/22.
//

import SwiftUI

struct OrderItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var price: String
}

struct OrderStatusView: View {
    @State var orderPreparing = "You order is about to be ready!"
    @State var orderReady = "Your order is ready to pick up!"
    var width: CGFloat = 300
    var height: CGFloat = 20
    @State var timeRemaining:CGFloat = 30
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var orderList = [
        OrderItem(name: "Hand-Made Burger", price: "$9.99"),
        OrderItem(name: "Poke Bowl", price: "$11.99")
    ]
    var body: some View {
        let progress:CGFloat = (30 - timeRemaining)
        VStack{
            Spacer()
            if(timeRemaining < 15 && timeRemaining > 0) {
                Text(orderPreparing)
            } else if (timeRemaining == 0) {
                Text(orderReady)
            } else {
                Text("Your order is placed, waiting to be prepared")
            }
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 20, style: .continuous).frame(width: width, height: height, alignment: .center)
                    .foregroundColor(Color.black.opacity(0.1))
                RoundedRectangle(cornerRadius: 20,style: .continuous).frame(width: progress*10, height: height)
                    .foregroundColor(Color.red.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            Text("")
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                    timeRemaining -= 1
                    }
                }
            HStack{
                Text("Order #1234 Details")
            }
            List {
                ForEach(orderList) { item in
                    HStack {
                        Text(item.name)
                            .font(.system(size:15))
                        Spacer()
                        Text(item.price)
                            .font(.system(size:15))
                    }
                }
            }
            HStack{
                Button(action: {
                }){
                    Text("Help with order")
                        .font(.body.weight(.medium))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }.padding()
                Button(action: {
                }){
                    Text("Show Barcode")
                        .font(.body.weight(.medium))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }.padding()
            }
        }
    }
}

struct OrderStatusView_Previews: PreviewProvider {
    static var previews: some View {
        OrderStatusView()
    }
}
