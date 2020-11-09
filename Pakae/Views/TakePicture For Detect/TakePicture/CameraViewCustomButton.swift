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
                }.offset(y: -45)
                
                // BUTTON SHORT
                Button(action: {
                    // your action here
                }) {
                    Text("Short")
                        .foregroundColor(.white)
                }.offset(y: -45)
                
                
                // BUTTON SHOES
                Button(action: {
                    // your action here
                }) {
                    Text("Footwear")
                        .foregroundColor(.white)
                }.offset(y: -45)
                
                Spacer()
                
            }.offset(x: 15, y: -40)
            
            HStack{
                
                Spacer()
                
                // BUTTON GALLERY
                Image(systemName: "photo").font(.largeTitle)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .offset(x:-3 ,y: -60)
                
                Spacer()
                
                // BUTTON JEPRET
                Image(systemName: "camera").font(.largeTitle)
                    .padding(30)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(x:2, y: -60)
                
                Spacer()
                
                // BUTTON ROTATE
                Image(systemName: "video").font(.largeTitle)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .offset(x:2, y: -60)
                
                Spacer()
                
            }
            
            
        }
    }
}
