//
//  HTTPClient.swift
//  Pakae
//
//  Created by Andimas Bagaswara on 10/10/20.
//

import Foundation
import Combine
import SwiftUI
import MobileCoreServices

class HTTPClient : ObservableObject{
    
    var didChange = PassthroughSubject<HTTPClient, Never>()
    
    @Published var isCorrect : Bool = true
    
    @Published var isLoggedin : Bool = false {
        didSet{
            didChange.send(self)
        }
    }
    
    func cekLogin(password: String, email: String){
        guard let url = URL(string: "http://18.140.3.202:8080/api/v1/auth/user-sign-in") else{
            return
        }
        
        let body : [String : String] = ["password" : password, "email" : email]
        
        guard let finalbody = try? JSONEncoder().encode(body) else{
            return
        }
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finalbody
        
        URLSession.shared.dataTask(with: request){(data, response, error) in
            guard let data = data, error == nil else {return}
            
            let result = try? JSONDecoder().decode(UserSignInModel.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    if(!result.access_token.isEmpty){
                        self.isLoggedin = true
                        
                        UserDefaults.standard.set(result.access_token, forKey: "access_token")
                        UserDefaults.standard.set(result.refresh_token, forKey: "refresh_token")
                        
                        print("Success Login")
                        
                        print(result.access_token)
                        print(UserDefaults.standard.string(forKey: "access_token")!)
                    }
                    
                }
            }else{
                DispatchQueue.main.async {
                    self.isCorrect = false
                }
            }
            
        }.resume()
    }
}



