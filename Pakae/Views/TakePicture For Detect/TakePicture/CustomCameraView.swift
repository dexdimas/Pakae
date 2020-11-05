//
//  CustomCameraView.swift
//  Pakae
//
//  Created by Stendy Antonio on 21/10/20.
//

import SwiftUI
import AVFoundation
import FirebaseStorage
import MobileCoreServices

struct CustomCameraView: View {
    
    @Binding var image: UIImage?
    
    @State var didTapCapture: Bool = false
    
    @State private var animationAmount: CGFloat = 1
    
    @State var shown = false
    
    @State private var didTap:Bool = false
    @State private var didTap1:Bool = false
    @State private var didTap2:Bool = false
    
    @State private var isActive:Bool = false
    
    var flag = 0
    
    var body: some View {
        NavigationView{
            ZStack(alignment:.bottom){
                
                CustomCameraRepresentable(image: self.$image, didTapCapture: $didTapCapture)
                
                VStack{
                    Spacer()
                    
                    HStack{
                        
                        Spacer()
                        
                        // BUTTON TOP
                        Button(action: {
                            self.didTap = true
                            self.didTap1 = false
                            self.didTap2 = false
                        }) {
                            Text("Top")
                        }
                        .foregroundColor(didTap ? Color.red : Color.white)
                        .offset(y: -25)
                        
                        
                        // BUTTON SHORT
                        Button(action: {
                            self.didTap = false
                            self.didTap1 = true
                            self.didTap2 = false
                        }) {
                            Text("Short")
                        }
                        .foregroundColor(didTap1 ? Color.red : Color.white)
                        .offset(y: -25)
                        
                        
                        // BUTTON SHOES
                        Button(action: {
                            self.didTap = false
                            self.didTap1 = false
                            self.didTap2 = true
                        }) {
                            Text("Footwear")
                        }
                        .foregroundColor(didTap2 ? Color.red : Color.white)
                        .offset(y: -25)
                        
                        Spacer()
                        
                    }.offset(x: 15, y: -20)
                    
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
                            self.isActive = true
                            
                            
                        }.offset(y: -25)
                        
                        NavigationLink("", destination: MLDetection(urlSendImage:.constant(UserDefaults.standard.string(forKey: "url_image")!)), isActive: self.$isActive)

                        Spacer()
                        
                        // BUTTON ROTATE
                        Image(systemName: "video").font(.largeTitle)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Rectangle())
                            .offset(y: -25)
                            .onTapGesture {
                                CustomCameraController().setupDevice()
                            }
                        
                        Spacer()
                        
                    }
                    
                    
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
        
        @State var urlSendImage = ""
        
        init(_ parent: CustomCameraRepresentable) {
            self.parent = parent
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?){
            
            parent.didTapCapture = false
            
            if let imageData = photo.fileDataRepresentation() {
                
                parent.image = UIImage(data: imageData)
                
                sendImage(userid: "1", password: "1", email: "1", gambar: parent.image!)
                
            }
        }
        
        func createRequest(userid: String, password: String, email: String, gambar: UIImage) throws -> URLRequest {
            
            let tapCount = UserDefaults.standard.string(forKey: "access_token")
            
            let parameters = [
                "user_id"  : userid,
                "email"    : email,
                "password" : password]  // build your dictionary however appropriate
            
            let boundary = generateBoundaryString()
            
            let url = URL(string: "http://18.140.3.202:8080/api/v1/user/post-image")!
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            let accessToken = "\(tapCount!)"
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            request.httpBody = try createBody(with: parameters, filePathKey: "file", boundary: boundary, gambar: gambar)
            
            return request
        }
        
        private func createBody(with parameters: [String: String]?, filePathKey: String, boundary: String, gambar: UIImage) throws -> Data {
            var body = Data()
            
            parameters?.forEach { (key, value) in
                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.append("\(value)\r\n")
            }
            
            let filename = "\(TakePicturePage().convertdata()).jpg"
            let data = gambar.jpegData(compressionQuality: 0.35)
            let mimetype = mimeType(for: filename)
            
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"gambar\"; filename=\"\(filename)\"\r\n")
            body.append("Content-Type: \(mimetype)\r\n\r\n")
            body.append(data!)
            body.append("\r\n")
            
            body.append("--\(boundary)--\r\n")
            return body
        }
        
        private func generateBoundaryString() -> String {
            return "Boundary-\(UUID().uuidString)"
        }
        
        private func mimeType(for path: String) -> String {
            let pathExtension = URL(fileURLWithPath: path).pathExtension as NSString
            
            guard
                let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension, nil)?.takeRetainedValue(),
                let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue()
            else {
                return "application/octet-stream"
            }
            
            return mimetype as String
        }
        
        func sendImage(userid: String, password: String, email: String, gambar: UIImage){
            let request: URLRequest
            
            do {
                request = try createRequest(userid: userid, password: password, email: email, gambar: gambar)
            } catch {
                print(error)
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    // handle error here
                    print(error ?? "Unknown error")
                    return
                }
                
                let result = try? JSONDecoder().decode(CameraSendModel.self, from: data)
                
                if let result = result{
                    DispatchQueue.main.async {
                        if(!result.id.isEmpty){
                            
                            print("Success send")
                            print(result.id)
                            
                            
                            //                            self.urlSendImage = "\(result.img_url)"
                            
                            UserDefaults.standard.set(result.img_url, forKey: "url_image")
                            
                            
                        }
                        
                    }
                }else{
                    DispatchQueue.main.async {
                    }
                }
            }
            task.resume()
            
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

extension Data {
    
    /// Append string to Data
    ///
    /// Rather than littering my code with calls to `data(using: .utf8)` to convert `String` values to `Data`, this wraps it in a nice convenient little extension to Data. This defaults to converting using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `Data`.
    
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
