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
                Button(action: {
                    // your action here
                }) {
                    Text("Top")
                        .foregroundColor(.white)
                }.offset(y: -25)
                
                
                
                // BUTTON SHORT
                Button(action: {
                    // your action here
                }) {
                    Text("Short")
                        .foregroundColor(.white)
                }.offset(y: -25)
                
                
                // BUTTON SHOES
                Button(action: {
                    // your action here
                }) {
                    Text("Footwear")
                        .foregroundColor(.white)
                }.offset(y: -25)
                
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
                    .offset(y: -25)
                
                Spacer()
                
                // BUTTON JEPRET
                CameraCaptureButtonView()
                    .offset(y: -25)
                
                Spacer()
                
                // BUTTON ROTATE
                Image(systemName: "video").font(.largeTitle)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .offset(y: -25)
                
                Spacer()
                
            }
            
            
        }
    }
}
