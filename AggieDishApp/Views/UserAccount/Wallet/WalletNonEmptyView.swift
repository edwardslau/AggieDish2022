//
//  WalletNonEmptyView.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/6/22.
//

import SwiftUI

struct WalletNonEmptyView: View {
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
                NavigationLink(destination: AddPaymentView()) {
                    Text("Add Payment Method")
                        .font(.body.weight(.medium))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .padding()
                Spacer()
            }
        }
        .navigationTitle("Saved Payment Method")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WalletNonEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        WalletNonEmptyView()
            .previewInterfaceOrientation(.portrait)
    }
}
