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
    @State var personsToSplitBill = 1
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = "."
        return formatter
    }() // execute the closure
    
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
            
            VStack(alignment: .leading) {
                Text("Number of persons to split bill:").foregroundColor(.gray)
                Stepper(value: $personsToSplitBill, in: 1...5, step: 1) {
                    HStack {
                        Text("Split by People:")
                        Text("\(personsToSplitBill)")
                            .font(.title2)
                    }
                }
            }
            
            Button(action: {
                calculateTip()
            }, label: {
                Text("Calculate Bill with Tip")
                    .frame(width: 350, height: 50)
                    .background(.appPink)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            })
            
            Button(action: {
                resetValues()
            }, label: {
                Text("Cancel")
                    .frame(width: 350, height: 50)
                    .background(.gray.opacity(0.2))
                    .foregroundColor(.appPink)
                    .cornerRadius(12)
            })
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
    
    func calculateTip() {
        print("Calculate Bill")
        guard let billAmountNumber = formatter.number(from: bill) else {
            return // if the bill is not a number, return
        }
        
        let billAmount = Float(truncating: billAmountNumber)
        let tipPercent = Float(selectedPercent) / 100.0
        let totalBillWithTip = billAmount * (1 + tipPercent)
        
        let totalPerPerson = totalBillWithTip / Float(personsToSplitBill)
    }
    
    func resetValues() {
        print("Cancel")
        
    }
}

#Preview {
    ContentView()
}
