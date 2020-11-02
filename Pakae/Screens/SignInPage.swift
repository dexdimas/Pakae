//
//  SignInPage.swift
//  Pakae
//
//  Created by Stendy Antonio on 14/10/20.
//

import SwiftUI

struct SignInPage: View {
        
    @StateObject private var userAuth = HTTPClient()
    
    var body: some View {
        VStack{
            if !userAuth.isLoggedin{
                AnyView(TakePicturePage())
            }else{
                Login().environmentObject(userAuth)
            }
        }
    }
}

struct Login: View{
    
    @EnvironmentObject var userAuth: HTTPClient
    
    @State var textEmail: String = ""
    @State var password: String = ""
    
    
    @State var isEmptyField = false
    
    var body: some View{
        VStack{
            
            //         UsernameLabelandTextField().keyboardType(.emailAddress).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            //            MustContainsEmailLabel()
            
            //            PasswordLabelandTextField().autocapitalization(.none)
            
            //            PasswordLessThanLabel()
            
            HStack{
                
                Text("Email")
                
                Spacer()
                
            }
            
            TextField("Email", text: $textEmail)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            SecureField("Password", text: $password)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if(!self.userAuth.isCorrect){
                Text("Username atau Password Salah").foregroundColor(.red)
            }
            
            if(self.isEmptyField){
                Text("Username atau Password tidak boleh kosong").foregroundColor(.red)
            }
            
            Spacer()
            
            //            SigninButton()
            
            Button(action: {
                
                if(self.textEmail.isEmpty || self.password.isEmpty){
                    self.isEmptyField = true
                }else{
                    self.userAuth.cekLogin(password: self.password, email: self.textEmail)
                }
                
            }, label: {
                
                Text("Sign In")
                    
                    .frame(width: 350, height: 40)
                    
                    .foregroundColor(.white)
                    
                    .background(Color.red)
                    
                    .cornerRadius(10.0)
                
            })
            
        }
        .padding()
        
    }
}

struct SignInPage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SignInPage()
        
    }
    
}
