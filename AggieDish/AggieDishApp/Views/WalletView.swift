//
//  WalletView.swift
//  AggieDish
//
//  Created by Ruiyi He on 1/28/22.
//

import SwiftUI

struct WalletView: View {
    var body: some View {

        ZStack(alignment: .bottom) {

            List {
                HStack {
                    Image("logo_mastercard")
                        .resizable()
                        .frame(width: 40, height: 30, alignment: .leading)
                    Text("Card Ending with")
                }
                .padding()
                
                HStack {
                    Image("logo_visa")
                        .resizable()
                        .frame(width: 40, height: 15, alignment: .leading)
                    Text("Card Ending with")
                }
                .padding()

                HStack {
                    Image("logo_amex")
                        .resizable()
                        .frame(width: 40, height: 30, alignment: .leading)
                    Text("Card Ending with")
                }
                .padding()
                HStack {
                    Image("logo_aggiecash")
                        .resizable()
                        .frame(width: 100, height: 20, alignment: .leading)
                }
                .padding()
            }
            
            
            
            

            HStack {
                Spacer()
                Button(action: {
                    // do something
                }){
                    Text("Add Payment Method")
                        .font(.body.weight(.medium))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }.padding()
                Spacer()
            }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
            .previewInterfaceOrientation(.portrait)
    }
}
