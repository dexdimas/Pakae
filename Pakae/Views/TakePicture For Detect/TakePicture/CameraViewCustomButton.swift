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
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .offset(x:-4 ,y: -60)
                
                Spacer()
                
                // BUTTON JEPRET
                Image("Shutter").font(.largeTitle)
                    .padding(30)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .offset(x:3, y: -60)
                
                Spacer()
                
                // BUTTON ROTATE
                Image("Celana").font(.largeTitle)
                    .frame(width: 50, height: 50)
                    .clipShape(Rectangle())
                    .offset(x:4, y: -60)
                
                Spacer()
                
            }
            
            
        }.background(Color.black)
    }
}
