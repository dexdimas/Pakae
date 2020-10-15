//
//  UsernameLabelandTextField.swift
//  Pakae
//
//  Created by Stendy Antonio on 15/10/20.
//

import SwiftUI

struct UsernameLabelandTextField: View {
    
    @State var username: String = ""

    var body: some View {
        
        HStack{
            
            Text("Username")
            
            Spacer()
            
        }
        
        TextField("Insert Username", text:$username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        
    }
    
}
