//
//  HTTPClient.swift
//  Pakae
//
//  Created by Andimas Bagaswara on 10/10/20.
//

import Foundation
import Combine
import SwiftUI

class HTTPClient : ObservableObject{
    
//    func get(completion: @escaping(User) -> ()){
//        let urlString = "some URL"
//        if let url = URL(string: urlString){
//            URLSession.shared.dataTask(with: url){data, res, err in
//
//                if let data = data{
//                     print("flag")
//
//                    let decoder = JSONDecoder()
//                    if let json = try? decoder.decode(User.self, from: data){
//                        completion(json)
//                    }
//                }
//
//            }.resume()
//            print("Finished")
//        }
//    }
//
//    func postJSON(completion: @escaping (Int) -> ()){
//        let url = URL(string: "")!
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        let json = [
//            "email" : "email@yahoo.com",
//            "password" : "password"
//        ]
//
//        if let JSONData = try? JSONSerialization.data(withJSONObject: json, options: []){
//            URLSession.shared.uploadTask(with: request, from: JSONData){ data, response, error in
//                print("Some Actions")
//                if let httpResponse = response as? HTTPURLResponse {
//                    completion(httpResponse.statusCode)
//                }
//
//            }.resume()
//        }
//    }
    
    var didChange = PassthroughSubject<HTTPClient, Never>()
    
    @Published var isCorrect : Bool = true
    
    @Published var isLoggedin : Bool = false {
        didSet{
            didChange.send(self)
        }
    }
    
    func cekLogin(password: String, email: String){
        guard let url = URL(string: "http://klopp-v1.ap-southeast-1.elasticbeanstalk.com/api/v1/auth/user-sign-in") else{
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


