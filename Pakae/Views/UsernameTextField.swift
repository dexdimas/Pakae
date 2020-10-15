//
//  UsernameTextField.swift
//  Pakae
//
//  Created by Stendy Antonio on 15/10/20.
//

import SwiftUI

struct UsernameTextField: View {
    
    @State var username: String = ""

    var body: some View {
        
        TextField("Insert Username", text:$username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
    }
    
}

struct UsernameTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        
        UsernameTextField()
        
    }
    
}
