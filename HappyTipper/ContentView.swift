//
//  ContentView.swift
//  HappyTipper
//
//  Created by main on 2023/12/7.
//

import SwiftUI

struct ContentView: View {
    @State var bill: String = ""
    var body: some View {
        VStack(spacing: 30) {
            Text("HappyTipper")
                .font(.title2)
                
            PriceCardView()
            
            VStack(alignment: .leading, content: {
                Text("Enter your total bill amount:")
                TextField("", text: $bill) // binding required
                    .font(.system(size: 22))
                    .padding(20) // text ditance to the left
                    .frame(width: 350, height: 50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(12)
            })
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
