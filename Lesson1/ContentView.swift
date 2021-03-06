//
//  ContentView.swift
//  Lesson1
//
//  Created by CC on 12/07/2020.
//  Copyright © 2020 CC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson :Double{
        //calculate $$ per person
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
     let tipValue = orderAmount * tipSelection / 100
        let grandTotal = (orderAmount + tipValue)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson    }
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Amount",text: $checkAmount)
                    .keyboardType(.decimalPad)
                
                
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2 ..< 100){
                        Text("\($0) people")
                    }
                }
            }
            Section(header:Text("How much tip you want to leave?")) {
                Picker("% tip",selection: $tipPercentage){
                    ForEach(0 ..< tipPercentages.count){
                        Text("\(self.tipPercentages[$0])")
                    }
                }
            .pickerStyle(SegmentedPickerStyle())
            }
            Section{
                Text("€ \(totalPerPerson, specifier: "%.2f")")
            }
            }.navigationBarTitle("We split!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
