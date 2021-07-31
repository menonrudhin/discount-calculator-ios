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
              .padding().background(Color.green.blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)).frame(maxWidth: .infinity);
            
            HStack {
                TextField("Price", text: $price).border(Color(UIColor.separator));
                TextField("Dicount", text: $discount).border(Color(UIColor.separator));
                TextField("Amount", text: $amount).border(Color(UIColor.separator));
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
