//
//  UserSignIn Model.swift
//  Pakae
//
//  Created by Stendy Antonio on 29/10/20.
//

import Foundation
import SwiftUI

struct UserSignInModel: Codable {
    
    let access_token: String
    let refresh_token: String
    
}

struct CameraSendModel: Codable{
    let id: String
    let created_at: String
    let updated_at: String
    let title: String
    let issuer: String
    let issue_category: String
    let img_url: String
    let tags: [String]
    let cloth_category: String
    let cloth_type: String
}

struct MainTags: Codable {
    let color: String
    let pattern:String
}

