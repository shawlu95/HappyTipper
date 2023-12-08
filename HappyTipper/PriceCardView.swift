//
//  PriceCardView.swift
//  HappyTipper
//
//  Created by main on 2023/12/7.
//

import SwiftUI

struct PriceCardView: View {
    var body: some View {
        VStack (spacing: 10) {
            Group {
                Text("Total per person: $100.00")
                Text("Grand Total: $200.00")
            }.font(.title2)
            
            Group {
                Text("Bill: $150.00")
                Text("Your Tip: $50.00 (20%)")
                Text("Split by: 2")
            }.opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 350, height: 170)
        .background(.appPink)
        .cornerRadius(20.0)
        .foregroundColor(.white)
        
    }
}

#Preview {
    PriceCardView()
}
