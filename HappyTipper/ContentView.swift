//
//  ContentView.swift
//  HappyTipper
//
//  Created by main on 2023/12/7.
//

import SwiftUI

struct ContentView: View {
    @State var bill: String = ""
    @State var selectedPercent = 5
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
            
            // spacing 30 should apply to this one too
            VStack() {
                Text("Select your desired tip percentage:")
                Picker("Tip", selection: $selectedPercent) {
                    Text("0%").tag(0)
                    Text("5%").tag(5)
                    Text("10%").tag(10)
                    Text("15%").tag(15)
                }.pickerStyle(.segmented)
            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

#Preview {
    ContentView()
}
