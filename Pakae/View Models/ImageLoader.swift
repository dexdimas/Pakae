//
//  ImageLoader.swift
//  Pakae
//
//  Created by Stendy Antonio on 05/11/20.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader:ObservableObject{
    var downloadedImage:UIImage?
    
    func fetchImage(url: String){
        guard let imageURL = URL(string: url) else{
            fatalError("the url string is invalid")
        }
        
        URLSession.shared.dataTask(with: imageURL){ data, response, error in
            guard let data = data, error == nil else{
                fatalError("Error Loading the image")
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = UIImage(data: data)
            }
        }
    }
    
}
