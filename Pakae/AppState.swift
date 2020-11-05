//
//  AppState.swift
//  Pakae
//
//  Created by Stendy Antonio on 05/11/20.
//

import SwiftUI

class AppState: ObservableObject{
    init() {
        if !UserDefaults.standard.bool(forKey: "access_token"){
            UserDefaults.standard.set(true, forKey: "access_token")
            didLaunchBefore = false
        }
        else{
            didLaunchBefore = true
        }
    }
    
    @Published var didLaunchBefore: Bool
}
