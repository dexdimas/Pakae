//
//  SignUpScreen.swift
//  Pakae
//
//  Created by Andimas Muhammad Bagaswara on 15/10/20.
//

import SwiftUI

struct SignUpPage: View {
    
    @State var fullName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            
            Group {
                HStack {
                    Text("Full Name")
                        .bold()
                    Spacer()
                }
                TextField("", text: $fullName, onCommit:  {
                    
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 30)
            }
            
            
            Group {
                HStack {
                    Text("Email")
                        .bold()
                    Spacer()
                }
                TextField("", text: $email, onCommit:  {
                    
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 30)
            }
            
            Group {
                HStack {
                    Text("Password")
                        .bold()
                    Spacer()
                }
                TextField("", text: $password, onCommit:  {
                    
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Spacer()
            
            Button("Continue") {
                
            }
            .primaryButton()
        }
        .padding()
        .padding(.top, 30)
        .navigationTitle("Sign Up")
        .embedNavigationView()
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
