//
//  CustomCameraView.swift
//  Pakae
//
//  Created by Stendy Antonio on 21/10/20.
//

import SwiftUI
import AVFoundation
import FirebaseStorage

struct CustomCameraView: View {
    
    @Binding var image: UIImage?
    
    @State var didTapCapture: Bool = false
    
    @State private var animationAmount: CGFloat = 1
    
    @State var shown = false
    
    var flag = 0
    
    var body: some View {
        ZStack(alignment:.bottom){
            
            CustomCameraRepresentable(image: self.$image, didTapCapture: $didTapCapture)
            
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
                    }.offset(y: -25)
                    

                    // BUTTON SHORT
                    Button(action: {
                        // your action here
                    }) {
                        Text("Short")
                            .foregroundColor(.white)
                    }.offset(y: -25)
                    
                    
                    // BUTTON SHOES
                    Button(action: {
                        // your action here
                    }) {
                        Text("Footwear")
                            .foregroundColor(.white)
                    }.offset(y: -25)
                    
                    Spacer()
                    
                }
                
                HStack{
                    
                    Spacer()
                    
                    // BUTTON GALLERY
                    Image(systemName: "photo").font(.largeTitle)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Rectangle())
                        .offset(y: -25)
                        .onTapGesture {
                            self.shown.toggle()
                        }.sheet(isPresented: $shown){
                            imagePicker(shown: $shown)
                        }
                    
                    Spacer()
                    
                    // BUTTON JEPRET
                    CameraCaptureButtonView().onTapGesture {
                        self.didTapCapture = true
                    }.offset(y: -25)
                    
                    Spacer()
                    
                    // BUTTON ROTATE
                    Image(systemName: "video").font(.largeTitle)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .clipShape(Rectangle())
                        .offset(y: -25)
                        .onTapGesture {
                    
                        }
                    
                    Spacer()
                    
                }
                
                
            }
            
        }
    }
}


struct CustomCameraRepresentable: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    @Binding var didTapCapture: Bool
    
    func makeUIViewController(context: Context) -> CustomCameraController {
        let controller = CustomCameraController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ cameraViewController: CustomCameraController, context: Context) {
        
        if(self.didTapCapture) {
            cameraViewController.didTapRecord()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {
        let parent: CustomCameraRepresentable
        
        init(_ parent: CustomCameraRepresentable) {
            self.parent = parent
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            
            parent.didTapCapture = false
                        
            if let imageData = photo.fileDataRepresentation() {
                parent.image = UIImage(data: imageData)
                
                Storage.storage().reference(forURL: "gs://pakeniapps-project.appspot.com").child("\(TakePicturePage().convertdata()).jpeg").putData(parent.image!.jpegData(compressionQuality: 0.35)!, metadata: nil){
                    (_, err) in
                    if err != nil{
                        return
                    }
                }
            }
        }
    }
}

struct CustomCameraRepresentable1: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> CustomCameraController {
        let controller = CustomCameraController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ cameraViewController: CustomCameraController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {
        let parent: CustomCameraRepresentable1
        
        init(_ parent: CustomCameraRepresentable1) {
            self.parent = parent
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


