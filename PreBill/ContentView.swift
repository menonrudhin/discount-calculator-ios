//
//  ContentView.swift
//  PreBill
//
//  Created by Rudhin Menon on 2021-07-28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var price: String = "0.0";
    @State private var discount: String = "0.0";
    @State private var amount: String = "0.0";
    
    var body: some View {
        VStack {
            Text("Test App").foregroundColor(Color.white)
              .padding().background(Color.green.blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/));
            
            HStack {
                TextField("Price", text: $price).border(Color(UIColor.separator)).keyboardType(.decimalPad)
                    .onChange(of: price, perform: { value in
                    calculate()
                });
                TextField("Dicount", text: $discount).border(Color(UIColor.separator)).keyboardType(.decimalPad).onChange(of: discount, perform: {value in calculate()
                });
                Text(amount).border(Color(UIColor.separator));
            }
        }
    }
    
    /**
            Calculate "amount" whenever user inputs change
     */
    func calculate() -> Void {
        print("enter calculate")
        let _price: Float = (price as NSString).floatValue; // "let" as the value is never mutated in this scope
        let _discount: Float = (discount as NSString).floatValue;
        var _amount: Float = 0.0; // "var" to enable mutation
        _amount = _price - (_price * (_discount/100));
        amount = String(_amount);
        print("exit calculate")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
