//
//  SignInPage.swift
//  Pakae
//
//  Created by Stendy Antonio on 14/10/20.
//

import SwiftUI

struct SignInPage: View {
    
    @State var username: String = ""
    
    @State var password: String = ""
    
    var body: some View {
        
        //Username
        HStack{
            
            Text("Username")
            
            Spacer()
            
        }
        
        TextField("Insert Username", text:$username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        //Password
        HStack{
            
            Text("Password")
            
            Spacer()
            
        }
        
        SecureField("Insert Password", text:$username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
}

struct SignInPage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SignInPage()
        
    }
    
}
