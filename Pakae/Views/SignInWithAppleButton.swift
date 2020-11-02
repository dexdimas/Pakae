//
//  SignInWithAppleButton.swift
//  Pakae
//
//  Created by Stendy Antonio on 14/10/20.
//

import SwiftUI

struct SignInWithAppleButton: View {
    
    @ObservedObject var vm = SigninWithAppleViewModel()
    
    var body: some View {
        
        VStack{
            
            if vm.user != nil{
                
                VStack{
                    
                    Text("user name: \n\(vm.user!.fullName)")
                    
                    Text("email: \n\(vm.user!.email)")
                    
                    Text("auth State\n\(vm.user!.authState)")
                        
                    Text("ID : \(vm.user!.credentialid)")
                        
                        .foregroundColor(vm.user?.authState == "authorized" ? .green : .primary)
                    
                }.padding(.horizontal)
                
                .font(.custom("Apple SD Gothic Neo", size: 40))
                
            }else{
                
                Button(action: {self.vm.getRequest()}){
                    
                    AppleIdButton()
                        
                        .frame(width: 350, height: 40)
                        
                        .foregroundColor(.white)
                        
                        .background(Color.red)
                        
                        .cornerRadius(10.0)
                    
                }
                
            }
            
        }.onAppear(){
            
            self.vm.getUserInfo()
            
        }
        
        .shadow(color: Color.secondary.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 8)
        
    }
    
}
