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
                    //ACTION
                }) {
                    Text("Top")
                }.padding()
                
                
                // BUTTON SHORT
                Button(action: {
                    //ACTION
                }) {
                    Text("Short")
                }.padding()
                
                
                // BUTTON SHOES
                Button(action: {
                    //ACTION
                }) {
                    Text("Footwear")
                }.padding()
                
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
