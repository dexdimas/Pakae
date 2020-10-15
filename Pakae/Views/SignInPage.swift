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
        
        VStack{
            
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
            
            Spacer()
            
            //Button SignIn
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                
                Text("Sign In")
                    
                    .frame(width: 350, height: 40)
                    
                    .foregroundColor(.white)
                    
                    .background(Color.red)
                    
                    .cornerRadius(10.0)
            })
            
        }.padding()
        
    }
    
}

struct SignInPage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SignInPage()
        
    }
    
}
