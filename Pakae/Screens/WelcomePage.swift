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
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Sign In")
            })
            .frame(width: 350, height: 40)
            
            .foregroundColor(.white)
            
            .background(Color.red)
            
            .cornerRadius(10.0)
            
            .shadow(color: Color.secondary.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 8)
            
            .padding()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Sign Up")
            })
            .frame(width: 350, height: 40)
            
            .foregroundColor(.red)
            
            .border(Color.red, width: 1)
            
            .cornerRadius(10.0)
            
            .shadow(color: Color.secondary.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 8)

            .padding()
            
            SignInWithAppleButton()
                
            .padding()
            
            SkipButton()
                .padding()
            
        }
        
    }
    
}

struct WelcomePage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WelcomePage()
        
    }
    
}
