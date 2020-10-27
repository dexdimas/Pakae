//
//  BasicInformationPage.swift
//  Pakae
//
//  Created by Stendy Antonio on 26/10/20.
//

import SwiftUI

struct BasicInformationPage: View {
    
    @State private var favoriteColor = 0
    
    @State private var height    : String = ""
    
    @State private var weight    : String = ""
    
    
    var body: some View {
        VStack {
            Text("Basic Information").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Spacer()
            Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                Text("Man").tag(0)
                Text("Female").tag(1)
            }.pickerStyle(SegmentedPickerStyle()).frame(width: 350)
            .padding(50)
            //            Text("Value: \(favoriteColor)")
            
            Text("Height(Cm)")
            TextField("", text: $height, onEditingChanged: { (isChanged) in
                
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            
            Text("Weight(Km)")
            TextField("", text: $weight, onEditingChanged: { (isChanged) in
                
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                
                Text("Continue")
                    
                    .frame(width: 350, height: 40)
                    
                    .foregroundColor(.white)
                    
                    .background(Color.red)
                    
                    .cornerRadius(10.0)
                
            })
        }
    }
}

struct BasicInformationPage_Previews: PreviewProvider {
    static var previews: some View {
        BasicInformationPage()
    }
}
