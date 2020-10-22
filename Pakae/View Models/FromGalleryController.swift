//
//  FromGalleryController.swift
//  Pakae
//
//  Created by Stendy Antonio on 22/10/20.
//

import SwiftUI
import FirebaseStorage

struct imagePicker : UIViewControllerRepresentable{
    
    func makeCoordinator() -> Coordinator {
        return imagePicker.Coordinator(parent1: self)
    }
    
    @Binding var shown : Bool
    
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
            
            Storage.storage().reference(forURL: "gs://pakeniapps-project.appspot.com").child("\(TakePicturePage().convertdata()).jpeg").putData(image.jpegData(compressionQuality: 0.35)!, metadata: nil){
                (_, err) in
                if err != nil{
                    return
                }
            }
            
            parent.shown.toggle()
    
        }
    }
    
}
