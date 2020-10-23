//
//  PasswordLabelandTextField.swift
//  Pakae
//
//  Created by Stendy Antonio on 15/10/20.
//

import SwiftUI

struct PasswordLabelandTextField: View {
    
    @State var password: String = ""
    
    var body: some View {
        
        
        HStack{
            
            Text("Password")
            
            Spacer()
            
        }
        
        SecureField("Insert Password", text:$password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
    
}

struct PasswordLabelandTextField_Previews: PreviewProvider {
    static var previews: some View {
       PasswordLabelandTextField()
    }
}
