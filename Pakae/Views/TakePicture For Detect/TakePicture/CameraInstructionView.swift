//
//  CameraInstructionView.swift
//  Pakae
//
//  Created by Stendy Antonio on 22/10/20.
//

import SwiftUI

struct CameraInstructionView: View {
    
    var body: some View {
        VStack{
            
            Image("Tshirt").resizable()
                
                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("Make sure item is in the frame and not folded")
                
                .multilineTextAlignment(.center)
                
                .foregroundColor(.white)
                
                .font(Font.system(size: 18))
                
                .lineLimit(2)
                
                .padding(10)
            
            Text("Tap anywhere to start")
                
                .multilineTextAlignment(.center)
                
                .foregroundColor(.white)
                
                .font(Font.system(size: 10))
            
                .padding(.top,25)
        }
        .padding(28)

//        .background(Color.gray.opacity(1))

        .cornerRadius(25)
    }
}


