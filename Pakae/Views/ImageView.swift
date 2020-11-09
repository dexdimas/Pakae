//
//  ImageView.swift
//  Pakae
//
//  Created by Stendy Antonio on 05/11/20.
//

import SwiftUI

struct ImageView: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    @State var gambartest = UIImage()
    
    var placeholder:Image
    
    init (url: String, placeholder: Image = Image(systemName: "photo")){
        self.placeholder = placeholder
        imageLoader.fetchImage(url: url)
    }
    
    var body: some View {
        
        Image(uiImage: gambartest).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).onReceive(imageLoader.$downloadedImage, perform: { data in
            self.gambartest = data ?? UIImage()
        })
        
    }
}
