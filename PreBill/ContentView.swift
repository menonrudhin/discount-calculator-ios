//
//  ContentView.swift
//  PreBill
//
//  Created by Rudhin Menon on 2021-07-28.
//

import SwiftUI

struct ContentView: View {
    
    @State private var price: String = "Price";
    @State private var discount: String = "Discount";
    @State private var amount: String = "Amount";
    @State private var tax: String = "Tax";
    
    var body: some View {
        VStack {
            Text("Discount Calculator iOS").foregroundColor(Color.white)
              .padding().background(Color.green.blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/));
            /*HStack {
                Spacer();
                Text("Price");
                Spacer();
                Text("Discount");
                Spacer();
                Text("Amount");
                Spacer();
            }*/
            HStack {
                Spacer();
                TextField("Price", text: $price).border(Color(UIColor.separator)).keyboardType(.decimalPad)
                    .onChange(of: price, perform: { value in
                    calculate()
                    }).padding();
                Spacer();
                TextField("Dicount", text: $discount).border(Color(UIColor.separator)).keyboardType(.decimalPad).onChange(of: discount, perform: {value in calculate()
                }).padding();
                Spacer();
                Text(amount).border(Color(UIColor.separator)).padding();
                Spacer();
            }
            HStack {
                Spacer();
                TextField("Tax", text: $tax).border(Color(UIColor.separator)).keyboardType(.decimalPad)
                    .onChange(of: tax, perform: { value in
                        calculate()
                    }).padding();
                Spacer();
            }
            Button("Add next item", action: addRow).padding(.horizontal).background(Color.blue).foregroundColor(Color.white).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
    }
    
    func addRow() -> Void {
        print("adding next item")
    }
    
    /**
            Calculate "amount" whenever user inputs change
     */
    func calculate() -> Void {
        print("enter calculate")
        let _price: Float = (price as NSString).floatValue; // "let" as the value is never mutated in this scope
        let _discount: Float = (discount as NSString).floatValue;
        let _tax: Float = (tax as NSString).floatValue;
        var _amount: Float = 0.0; // "var" to enable mutation
        
        _amount = _price - (_price * (_discount/100));
        _amount = _amount + (_amount * (_tax * 0.01));
        amount = String(_amount);
        print("exit calculate")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
