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
    
    let tipsPercentage = [10,15,20,25,0]
    
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
                    Text(
                        checkAmount,
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
