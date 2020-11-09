//
//  FromGalleryController.swift
//  Pakae
//
//  Created by Stendy Antonio on 22/10/20.
//

import SwiftUI
import MobileCoreServices
import FirebaseStorage

struct imagePicker : UIViewControllerRepresentable{
    
    func makeCoordinator() -> Coordinator {
        return imagePicker.Coordinator(parent1: self)
    }
    
    @Binding var shown : Bool
    @Binding var Image_url: String
    @Binding var styledata: CameraSendModel
    
    @Binding var SendActive:Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController {
        let imagepic = UIImagePickerController()
        imagepic.sourceType = .photoLibrary
        imagepic.delegate = context.coordinator
        return imagepic
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>){
        
    }
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        var parent : imagePicker!
        init(parent1 : imagePicker){
            
            parent = parent1
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.shown.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            
            sendImage(userid: "2", password: "2", email: "2", gambar: image)
            
            print("Success Send from gallery")
            
            parent.shown.toggle()
            
            parent.SendActive = true
            
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
            
            //            let fileURL = Bundle.main.url(forResource: "image1", withExtension: "png")!
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
                
                print(result?.id)
                print(result?.created_at)
                print(result?.updated_at)
                print(result?.title)
                print(result?.issuer)
                print(result?.issuer_category)
                print(result?.img_url)
                print(result?.cloth_category)
                print(result?.cloth_type)
                
                DispatchQueue.main.async {
                    self.parent.Image_url = result!.img_url
                    
                    self.parent.styledata = result!
                }
             
                //
                //                if let result = result {
                //                    DispatchQueue.main.async {
                //                        if(!result.id.isEmpty){
                //                            print("Success send")
                //                        }
                //                    }
                //                }else{
                //                    DispatchQueue.main.async {
                //
                //                    }
                //                }
            }
            task.resume()
        }
        
    }
}
