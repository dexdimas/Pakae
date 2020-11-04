//
//  UserSignIn Model.swift
//  Pakae
//
//  Created by Stendy Antonio on 29/10/20.
//

import Foundation
import SwiftUI

struct UserSignInModel : Codable{
    
    let access_token: String
    let refresh_token: String
}

struct CameraSendModel{
    let id: String
    let created_at: String
    let updated_at: String
    let title: String
    let issuer: String
    let issuer_category: String
    let img_url: String
    let tags: [String]
    let cloth_category: String
    let cloth_type: String
    let main_tags: MainTags?
}

extension CameraSendModel: Decodable{
    enum CodingKeys: String, CodingKey{
        case id = "ID"
        case created_at = "CreatedAt"
        case updated_at = "UpdatedAt"
        case title = "Title"
        case issuer = "Issuer"
        case issuer_category = "IssuerCategory"
        case img_url = "ImgURL"
        case tags = "Tags"
        case cloth_category = "ClothCategory"
        case cloth_type = "ClothType"
        case main_tags
    }
}

struct MainTags{
    let color: String
    let pattern:String
}

extension MainTags: Decodable{
    enum CodingKeys: String, CodingKey{
        case color
        case pattern
        
    }
}
