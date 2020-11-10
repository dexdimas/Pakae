//
//  MLDetection.swift
//  Pakae
//
//  Created by Stendy Antonio on 04/11/20.
//

import SwiftUI
import Combine

extension String{
    func load() -> UIImage{
        do{
            guard let url = URL(string: self)
            else{
                return UIImage()
            }
            
            let data: Data = try Data (contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        }catch{
            
        }
        return UIImage()
    }
}

struct MLDetection: View {
    var url: String = ""
    
    @State private var name = ""
    
    var styledata: CameraSendModel = CameraSendModel.init(id: "", created_at: "", updated_at: "", title: "", issuer: "", issuer_category: "", img_url: "", tags: [""], cloth_category: "", cloth_type: "", main_tags: MainTags.init(color: "", pattern: ""))
    
    @StateObject private var userAuth = HTTPClient()
    
    var body: some View {
        
        VStack{
            
            Image(uiImage: url.load())
                .resizable()
                .frame(width: 400, height: 550)
            
            VStack(alignment:.leading){
                
                TextField("Write Item Title", text: $name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
                
                Divider()
                    .background(Color.black)
                    .padding(.horizontal, 20)
                
                Text("\(styledata.cloth_type)")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                    .padding(.leading)
                
                HStack{
                    Text("Color         : \(styledata.main_tags.color)")
                }
                .padding(.leading)
                
                HStack{
                    Text("Pattern      : \(styledata.main_tags.pattern)")
                }.padding(.bottom)
                .padding(.leading)
                
                Button(action: {
                    let data = CameraSendModel(id: styledata.id, created_at: styledata.created_at, updated_at: styledata.updated_at, title: name, issuer: styledata.issuer, issuer_category: styledata.issuer_category, img_url: styledata.img_url, tags: styledata.tags, cloth_category: styledata.cloth_category, cloth_type: styledata.cloth_type, main_tags: styledata.main_tags)
                    
                    print(data)
                   
                    userAuth.send_databaju(data: data)
                }, label: {
                    Text("Add to My Wardrobe")
                })
                .frame(width: 350, height: 40)
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10.0)
                .shadow(color: Color.secondary.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 8)
                .padding()
                
            }
            .frame(width: 412, height: 350)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(20.0)
            .shadow(color: Color.secondary.opacity(1.5), radius: 10, y: 8)
            .position(x: 190,y: 100)
            .padding()
            
        }.navigationBarHidden(true)
    }
}

struct MLDetection_Previews: PreviewProvider {
    static var previews: some View {
        MLDetection()
    }
}
