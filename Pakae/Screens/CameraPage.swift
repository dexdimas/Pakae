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
    @State private var image: Image?
    @State private var showingCustomCamera = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        
        NavigationView {
            VStack {
                ZStack {
                    Rectangle().fill(Color.secondary)
                    
                    if image != nil
                    {
                        image?
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    else
                    {
                        VStack{
                            
                            Text("Pastikan pakaian anda ada di tengah \n bingkai ini dalam kondisi tidak terlipat")
                                
                                .multilineTextAlignment(.center)
                                
                                .lineLimit(2)
                                
                                .padding(10)
                            
                            Image("ImageTest").resizable()
                                
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                        }
                        .padding(28)
                        
                        .background(Color.gray.opacity(0.5))
                        
                        .cornerRadius(25)
                    }
                }
                .onTapGesture {
                    self.showingCustomCamera = true
                }
            }
            .sheet(isPresented: $showingCustomCamera, onDismiss: loadImage) {
                CustomCameraView(image: self.$inputImage)
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        Storage.storage().reference(forURL: "gs://pakeniapps-project.appspot.com").child("image").putData(inputImage.jpegData(compressionQuality: 0.35)!, metadata: nil){
            (_, err) in
            if err != nil{
                return
            }
        }
    }
}
