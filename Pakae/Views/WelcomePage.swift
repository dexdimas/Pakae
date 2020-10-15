//
//  WelcomePage.swift
//  Pakae
//
//  Created by Stendy Antonio on 14/10/20.
//

import SwiftUI

struct WelcomePage: View {
    
    @ObservedObject var vm = SigninWithAppleViewModel()
    
    var body: some View {
        
        VStack{
            
            if vm.user != nil{
                
                VStack{
                    
                    Text("user name: \n\(vm.user!.fullName)")
                    
                    Text("email: \n\(vm.user!.email)")
                    
                    Text("auth State\n\(vm.user!.authState)")
                        
                        .foregroundColor(vm.user?.authState == "authorized" ? .green : .primary)
                    
                }.padding(.horizontal)
                
                .font(.custom("Apple SD Gothic Neo", size: 40))
                
            }else{
                
                Button(action: {self.vm.getRequest()}){
                    
                    AppleIdButton()
                        
                        .background(Color.primary)
                        
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                        
                        .padding(7)
                        
                        .frame(width: UIScreen.main.bounds.width*0.9, height: 76)
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    Text("Skip")
                        
                        .foregroundColor(.gray)
                        
                        .underline()
                        
                        .font(.title3)
                    
                })
                
            }
            
        }.onAppear(){
            
            self.vm.getUserInfo()
            
        }
        
        .shadow(color: Color.secondary.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 8)
        
    }
    
}

struct WelcomePage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WelcomePage()
        
    }
    
}
