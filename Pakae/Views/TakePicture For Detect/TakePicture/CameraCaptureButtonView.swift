//
//  CaptureButtonView.swift
//  Pakae
//
//  Created by Stendy Antonio on 21/10/20.
//

import SwiftUI

struct CameraCaptureButtonView: View {
        
    var body: some View {
        Image(systemName: "camera").font(.largeTitle)
            .padding(30)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            
    }
}

