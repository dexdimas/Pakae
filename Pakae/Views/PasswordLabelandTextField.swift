//
//  PasswordLabelandTextField.swift
//  Pakae
//
//  Created by Stendy Antonio on 15/10/20.
//

import SwiftUI

struct PasswordLabelandTextField: View {
    
    @State private var password    : String = ""
    
    @State private var isPasswordValid : Bool   = true

    
    var body: some View {
        
        
        HStack{
            
            Text("Password")
            
            Spacer()
            
        }
        
        TextField("Password", text: $password, onEditingChanged: { (isChanged) in
            if !isChanged {
                if self.passwordvalidator(self.password) {
                    self.isPasswordValid = true
                } else {
                    self.isPasswordValid = false
                    self.password = ""
                }
            }
        }).textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
    
    func passwordvalidator(_ string: String) -> Bool {
        if string.count > 6 {
            return true
        }
        return false
    }
    
}


