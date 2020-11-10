//
//  CaptureButtonView.swift
//  Pakae
//
//  Created by Stendy Antonio on 21/10/20.
//

import SwiftUI

struct CameraCaptureButtonView: View {
        
    var body: some View {
        Image("Shutter").resizable()
            .font(.largeTitle)
            .padding(30)
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            
    }
}

