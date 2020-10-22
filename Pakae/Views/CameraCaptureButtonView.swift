//
//  CaptureButtonView.swift
//  Pakae
//
//  Created by Stendy Antonio on 21/10/20.
//

import SwiftUI

struct CameraCaptureButtonView: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Image(systemName: "camera").font(.largeTitle)
            .padding(30)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                    .animation(Animation.easeOut(duration: 1)
                                .repeatForever(autoreverses: false))
            )
            .onAppear
            {
                self.animationAmount = 2
            }
    }
}

