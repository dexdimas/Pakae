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
            SignInWithAppleButton()
            
            SignInSkipButton()
            
            Spacer()
            
            SignInButton()
        }
        
    }
    
}

struct WelcomePage_Previews: PreviewProvider {
    
    static var previews: some View {

        WelcomePage()
        
    }
    
}
