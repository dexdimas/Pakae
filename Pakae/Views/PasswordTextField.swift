//
//  PasswordTextField.swift
//  Pakae
//
//  Created by Stendy Antonio on 15/10/20.
//

import SwiftUI

struct PasswordTextField: View {
    
    @State var password: String = ""
    
    var body: some View {
        
        SecureField("Insert Password", text:$password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
    
}

struct PasswordTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PasswordTextField()
        
    }
    
}
