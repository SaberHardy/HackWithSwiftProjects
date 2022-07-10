//
//  WeSplitBootCamp.swift
//  HackWithSwiftProjects
//
//  Created by MacBook on 08.07.2022.
//

import SwiftUI

struct WeSplitBootCamp: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfpeople = 2.0
    @State private var tipPercentage = 20.0
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfpeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(
                            code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                    
                    Picker("Number of people..",
                           selection: $numberOfpeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    
                    Picker("Tip percentages", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("How much tips you want to put")
                        .font(.body)
                        .bold()
                }
                
                Section {
                    Text(
                        totalPerPerson,
                        format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            }
            .navigationTitle("Navigation Form...")
        }
    }
}

struct WeSplitBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        WeSplitBootCamp()
    }
}
