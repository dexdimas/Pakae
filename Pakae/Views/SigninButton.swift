//
//  SigninButton.swift
//  Pakae
//
//  Created by Stendy Antonio on 15/10/20.
//

import SwiftUI

struct SigninButton: View {
    var body: some View {
        //Button SignIn
        Button(action: {
            
        }, label: {
            
            Text("Sign In")
                
                .frame(width: 350, height: 40)
                
                .foregroundColor(.white)
                
                .background(Color.red)
                
                .cornerRadius(10.0)
            
        })
    }
}
