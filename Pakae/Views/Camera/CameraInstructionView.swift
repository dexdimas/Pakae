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
            
            Image("ImageTest").resizable()
                
                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("Pastikan pakaian anda ada di tengah \n bingkai ini dalam kondisi tidak terlipat")
                
                .multilineTextAlignment(.center)
                
                .lineLimit(2)
                
                .padding(10)
            
        }
        .padding(28)

//        .background(Color.gray.opacity(1))

        .cornerRadius(25)
    }
}


