//
//  ContentView.swift
//  HappyTipper
//
//  Created by main on 2023/12/7.
//

import SwiftUI

struct ContentView: View {
    @State var originalBill: String = ""
    @State var tipPercent = 5
    @State var splitBy = 1
    
    @State var tip: String = "0.00"
    @State var totalBill: String = "0.00"
    @State var totalPerPerson: String = "0.00"
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = "."
        return formatter
    }() // execute the closure
    
    var body: some View {
        VStack(spacing: 30) {
            Text("HappyTipper")
                .font(.title2)
                
            PriceCardView(
                originalBill: $originalBill,
                tipPercent: $tipPercent,
                splitBy: $splitBy,
                tip: $tip,
                totalBill: $totalBill,
                totalPerPerson: $totalPerPerson)
            
            VStack(alignment: .leading, content: {
                Text("Enter your total bill amount:")
                TextField("", text: $originalBill) // binding required
                    .font(.system(size: 22))
                    .padding(20) // text ditance to the left
                    .frame(width: 350, height: 50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(12)
                
            })
            
            // spacing 30 should apply to this one too
            VStack() {
                Text("Select your desired tip percentage:")
                Picker("Tip", selection: $tipPercent) {
                    Text("0%").tag(0)
                    Text("5%").tag(5)
                    Text("10%").tag(10)
                    Text("15%").tag(15)
                }.pickerStyle(.segmented)
            }
            
            VStack(alignment: .leading) {
                Text("Number of persons to split bill:").foregroundColor(.gray)
                Stepper(value: $splitBy, in: 1...5, step: 1) {
                    HStack {
                        Text("Split by People:")
                        Text("\(splitBy)")
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
        .onChange(of: originalBill) { newValue in
            if newValue.isEmpty {
                resetValues()
            }
        }
        .onChange(of: tipPercent) { newValue in
            resetValues()
        }
    }
    
    func calculateTip() {
        guard let billAmountNumber = formatter.number(from: originalBill) else {
            return // if the bill is not a number, return
        }
        
        let billAmount = Float(truncating: billAmountNumber)
        let tipPercent = Float(tipPercent) / 100.0
        let tip = billAmount * tipPercent
        let totalBill = billAmount * (1 + tipPercent)
        let totalPerPerson = totalBill / Float(splitBy)
        
        self.tip = formatter.string(from: NSNumber(value: tip)) ?? ""
        self.totalBill = formatter.string(from: NSNumber(value: totalBill)) ?? ""
        self.totalPerPerson = formatter.string(from: NSNumber(value: totalPerPerson)) ?? ""
    }
    
    func resetValues() {
        self.tip = "0.00"
        self.totalBill = "0.00"
        self.totalPerPerson = "0.00"
        
        self.splitBy = 1
        self.tipPercent = 5
        self.originalBill = ""
        
    }
}

#Preview {
    ContentView()
}
