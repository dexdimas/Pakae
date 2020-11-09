//
//  WelcomePage.swift
//  Pakae
//
//  Created by Stendy Antonio on 15/10/20.
//

import SwiftUI

struct WelcomePage: View {
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Image("coba-5").resizable()
                .frame(width: 400, height: 350)
            
            SignInWithAppleButton()
                .shadow(color: Color.secondary.opacity(0.5), radius: 10, y: 8)
                .padding()
            
            Button(action: {
                
            }, label: {
                Text("Sign In")
            })
            .frame(width: 350, height: 40)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10.0)
            .shadow(color: Color.secondary.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 8)
            .padding()
            
            Button(action: {
                
            }, label: {
                Text("Sign Up")
            })
            .frame(width: 350, height: 40)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(10.0)
            .shadow(color: Color.secondary.opacity(0.5), radius: 10, y: 8)
            .padding()
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                
                Text("Skip")
                    .foregroundColor(.gray)
                    .font(.title3)
                
            })
            .padding()
            
        }
        
    }
    
}

struct WelcomePage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WelcomePage()
        
    }
    
}
