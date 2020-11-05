//
//  ImageView.swift
//  Pakae
//
//  Created by Stendy Antonio on 05/11/20.
//

import SwiftUI

struct ImageView: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    
    var placeholder:Image
    
    init (url: String, placeholder: Image = Image(systemName: "photo")){
        self.placeholder = placeholder
        imageLoader.fetchImage(url: url)
    }
    
    var body: some View {
        if let image = self.imageLoader.downloadedImage{
            return Image(uiImage: image)
        }
        
        return placeholder
    }
}
