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
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Back")
                    .offset(x: -170, y: -240)
            })
            
            Text("UserName")
                .offset(x: -125, y:-90)
            TextField("Insert Username", text:$username)
                .frame(width: 300, height: 20)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .offset(y: -90)
            
            Text("Password")
                .offset(x: -125, y:-90)
            SecureField("Insert Password", text:$username)
                .frame(width: 300, height: 20)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .offset(y: -90)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Sign In")
                    .frame(width: 300, height: 20)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .offset(y: 250)
            })
        }
        
        
    }
}

struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage()
    }
}
