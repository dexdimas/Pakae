//
//  CameraPage.swift
//  Pakae
//
//  Created by Stendy Antonio on 20/10/20.
//

import SwiftUI
import AVFoundation
import FirebaseStorage

struct TakePicturePage: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    private var date = Date()
    
    @State private var image: Image?
    @State private var showingCustomCamera = false
    @State private var inputImage: UIImage?
    
    @State private var isPresented = true
    
    var body: some View {
        
        VStack {
            ZStack {
                
                //VIEW 2
                CustomCameraRepresentable1()
                Spacer()
                CameraViewCustomButton()
                
                
                // VIEW 1
                if image != nil
                {
                    image?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                else
                {
                    if isPresented{
                        Rectangle().fill(Color.black.opacity(0.85))
                        CameraInstructionView().onTapGesture {
                            self.isPresented.toggle()
                            self.showingCustomCamera = true
                        }
                    }
                    else{
                        Rectangle().fill(Color.black.opacity(0))
                            .fullScreenCover(isPresented: $showingCustomCamera){
                                CustomCameraView(image: self.$inputImage).edgesIgnoringSafeArea(.all)
                            }
                    }
                    
                }
                
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func convertdata() -> String{
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        
        return formatter.string(from: self.date)
    }
    
}
