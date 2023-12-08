//
//  PriceCardView.swift
//  HappyTipper
//
//  Created by main on 2023/12/7.
//

import SwiftUI

struct PriceCardView: View {
    // use binding, not state, because the states come from other view
    // this view doesn't own the bind state
    @Binding var originalBill: String
    @Binding var tipPercent: Int
    @Binding var splitBy: Int
    
    @Binding var tip: String
    @Binding var totalBill: String
    @Binding var totalPerPerson: String
    
    var body: some View {
        VStack (spacing: 10) {
            Group {
                Text("Total per person: \(totalPerPerson)")
                Text("Grand Total: \(totalBill)")
            }.font(.title2)
            
            Group {
                Text("Bill: \(originalBill)")
                Text("Your Tip: \(tip) (\(tipPercent)%)")
                Text("Split by: \(splitBy)")
            }.opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 350, height: 170)
        .background(.appPink)
        .cornerRadius(20.0)
        .foregroundColor(.white)
        
    }
}

#Preview {
    PriceCardView(
        originalBill: .constant("$50.00"),
        tipPercent: .constant(10),
        splitBy: .constant(2),
        tip: .constant("$5.00"),
        totalBill: .constant("$55.00"),
        totalPerPerson: .constant("$27.50")
    )
}
