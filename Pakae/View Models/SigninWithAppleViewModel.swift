//
//  SigninWithAppleViewModel.swift
//  Pakae
//
//  Created by Stendy Antonio on 14/10/20.
//

import SwiftUI

final class SigninWithAppleViewModel: ObservableObject{
    private lazy var SignInWithApple = SignInWithAppleCoordinator()
    @Published var user: User?
    
    func getRequest(){
        SignInWithApple.getAppleRequest()
    }
    
    func getUserInfo(){
        if let userData = UserDefaults.standard.object(forKey: "user") as? Data,
           let userDecode = try? JSONDecoder().decode(User.self, from: userData){
            user = userDecode
        }
    }
}
