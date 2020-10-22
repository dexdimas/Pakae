//
//  CameraViewCustomButton.swift
//  Pakae
//
//  Created by Stendy Antonio on 22/10/20.
//

import SwiftUI

struct CameraViewCustomButton: View {
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                
                Spacer()
                
                // BUTTON TOP
                Image(systemName: "").font(.largeTitle)
                    .padding(20)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                
                Spacer()
                
                // BUTTON SHORT
                Image(systemName: "").font(.largeTitle)
                    .padding(20)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                
                Spacer()
                
                // BUTTON SHOES
                Image(systemName: "").font(.largeTitle)
                    .padding(20)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                
                Spacer()
                
            }
            
            HStack{
                
                Spacer()
                
                // BUTTON GALLERY
                Image(systemName: "photo").font(.largeTitle)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                
                Spacer()
                
                // BUTTON JEPRET
                CameraCaptureButtonView()
                
                Spacer()
                
                // BUTTON ROTATE
                Image(systemName: "video").font(.largeTitle)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                
                Spacer()
                
            }
            
            
        }
    }
}
