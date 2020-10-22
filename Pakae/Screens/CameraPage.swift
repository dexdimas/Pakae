//
//  CameraPage.swift
//  Pakae
//
//  Created by Stendy Antonio on 20/10/20.
//

import SwiftUI
import AVFoundation
import FirebaseStorage

struct CameraPage: View {
    
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
                CustomCameraView(image: self.$inputImage)
                
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
                    }
                    
                }
                
            }
            
            //            fullScreenCover(isPresented: $showingCustomCamera, onDismiss: loadImage){
            //                CustomCameraView(image: self.$inputImage)
            //            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func loadImage() {
        
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        Storage.storage().reference(forURL: "gs://pakeniapps-project.appspot.com").child("\(convertdata()).jpeg").putData(inputImage.jpegData(compressionQuality: 0.35)!, metadata: nil){
            (_, err) in
            if err != nil{
                return
            }
        }
    }
    
    func convertdata() -> String{
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        
        return formatter.string(from: self.date)
    }
    
}
