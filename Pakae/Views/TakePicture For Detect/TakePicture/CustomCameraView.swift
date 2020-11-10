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
    @State private var isActive2:Bool = false
    
    @ObservedObject var gambar2 = PhotoTemp()
    
    @State private var url: String = ""
    
    @State private var url_fromGallery: String = ""
    
    @State private var sendactive: Bool = false
    
    @State private var styledata: CameraSendModel = CameraSendModel.init(id: "", created_at: "", updated_at: "", title: "", issuer: "", issuer_category: "", img_url: "", tags: [""], cloth_category: "", cloth_type: "", main_tags: MainTags.init(color: "", pattern: ""))
    
    @State private var styledata_fromGallery: CameraSendModel = CameraSendModel.init(id: "", created_at: "", updated_at: "", title: "", issuer: "", issuer_category: "", img_url: "", tags: [""], cloth_category: "", cloth_type: "", main_tags: MainTags.init(color: "", pattern: ""))
    
    @State var flag = 0
    
    var body: some View {
        NavigationView{
            ZStack(alignment:.bottom){
                
//                CustomCameraRepresentable(image: self.$image, didTapCapture: $didTapCapture,Image_url: $url, flag1: flag, StyleData: $styledata)
                
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
                        Image(systemName: "photo")
//                            .resizable()
                            .font(.largeTitle)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Rectangle())
                            .offset(y: -25)
                            .onTapGesture {
                                self.shown.toggle()
                            }.sheet(isPresented: $shown){
                                imagePicker(shown: $shown, Image_url: $url_fromGallery, styledata: $styledata_fromGallery, SendActive: $sendactive)
                            }
                        
                        NavigationLink("", destination: MLDetection(url: url_fromGallery, styledata: styledata_fromGallery), isActive: self.$sendactive)
                        
                        Spacer()
                        
                        
//                         BUTTON JEPRET
                        CameraCaptureButtonView().onTapGesture {

                            self.didTapCapture = true
                            self.isActive = true
                            print("kepencet")


                        }.offset(y: -25)
                        
                        NavigationLink("", destination: MLDetection(url:url, styledata: styledata), isActive: self.$isActive)
                        
                        Spacer()
                        
                        // BUTTON ROTATE
                        Image("RotateCamera")
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 20, height: 20)
                            .clipShape(Rectangle())
                            .offset(y: -25)
                            .onTapGesture {
                               flag = 1
//                                CustomCameraController().setupDevice()
                            }
                        
                        Spacer()
                        
                    }.edgesIgnoringSafeArea(.all)
                }
            }.navigationBarHidden(true).background(Color.black)
            
        }
    }
}


struct CustomCameraRepresentable: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    @Binding var didTapCapture: Bool
    @Binding var Image_url:String
    
    @State var flag1 = 0
    
    @Binding var StyleData: CameraSendModel
    
    func makeUIViewController(context: Context) -> CustomCameraController {
        let controller = CustomCameraController()
        controller.flag = flag1
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ cameraViewController: CustomCameraController, context: Context) {
        
        if(self.didTapCapture) {
            cameraViewController.didTapRecord()
            didTapCapture = false
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
                "userid"  : userid,
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
                //                let maintags = MainTags.init(color: "a", pattern: "a")
                //
                //
                //                let result: CameraSendModel? = CameraSendModel(id: "1", created_at: "a", updated_at: "a", title: "a", issuer: "a", issuer_category: "a", img_url: "https://image.shutterstock.com/image-illustration/microscopic-image-coronavirus-disease-2019-600w-1705355893.jpg", tags: ["a"], cloth_category: "a", cloth_type: "a", main_tags: maintags)
                
                //                print(result?.id)
                //                print(result?.created_at)
                //                print(result?.updated_at)
                //                print(result?.title)
                //                print(result?.issuer)
                //                print(result?.issuer_category)
                //                print(result?.img_url)
                //                print(result?.cloth_category)
                //                print(result?.cloth_type)
                
                self.parent.Image_url = result!.img_url
                
                self.parent.StyleData = result!
                
                //                if let result = result{
                //                    DispatchQueue.main.async {
                //                        if(!result.id.isEmpty){
                //
                //                            print("Success send")
                //                            print(result.id)
                //
                //                            self.parent.Image_url = result.img_url
                //
                //                            print(result.img_url)
                //
                //                        }
                //
                //                    }
                //                }else{
                //                    DispatchQueue.main.async {
                //                    }
                //                }
            }
            task.resume()
            
        }
        
    }
}

struct CustomCameraRepresentable1: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> CustomCameraController1 {
        let controller = CustomCameraController1()
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ cameraViewController: CustomCameraController1, context: Context) {
        
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
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
