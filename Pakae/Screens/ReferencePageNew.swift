//
//  ReferencePageNew.swift
//  Pakae
//
//  Created by Evan Renanto on 04/11/20.
//

import SwiftUI

struct ReferencePageNew: View {
    
    var body: some View {
        
        NavigationView{
            
            Home()
                .navigationBarTitle("References")
        }
    }
}

struct ReferencePageNew_Previews: PreviewProvider {
    static var previews: some View {
        ReferencePageNew()
    }
}

struct Home : View {
    
    @State var data = [
        
        Type(name: "Cause You're My Favorite Outfit", pic: "coba-8", price: "Rp 499,900"),
        Type(name: "The Hi High Style Outfit ", pic: "coba-9", price: "Rp 549,900"),
        Type(name: "Fly Like a Butterfly Outfit", pic: "coba-10", price: "Rp 699,900"),
        Type(name: "So What Outfit", pic: "coba-11", price: "Rp 749,900"),
        Type(name: "Why Not Outfit", pic: "coba-5", price: "Rp 999,900"),
        Type(name: "Starlight Outfit", pic: "coba-6", price: "Rp 999,900"),
    ]
    
    @State var Grid : [Int] = []
    
    var body: some View {
        MainView(data: self.$data, Grid: self.$Grid)
            .onAppear(){
                self.generateGrid()
            }
    }
    
    func generateGrid(){
        
        for i in stride(from: 0, to: self.data.count, by: 2){
            
            if i != self.data.count{
                
                self.Grid.append(i)
            }
        }
    }
}

struct Card : View {
    
    var data : Type
    
    var body: some View {
        VStack{
            HStack{
                Image(data.pic)
                    .resizable()
                    .frame(width: 270, height: 300)
            }
            
            HStack{
                Text(data.name)
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .offset(y: -10)
            }.frame(width: 150, height: 50, alignment: .topLeading)
            
            
            HStack{
                Text(data.price)
                    .font(.custom("Poppins-Regular", size: 15))
                    .foregroundColor(.gray)
                    .offset(y: -10)
            }.frame(width: 150, height: 50, alignment: .topLeading)
            
            
        }.frame(width: 170, height: 360)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10 )
        
    }
}

struct MainView : View {
    
//    @ObservedObject var listData = getData()
    
    @Binding var data : [Type]
    @Binding var Grid : [Int]
    
    var body: some View {
        
        VStack{
            
            if !self.Grid.isEmpty{
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing : 20){
                        
                        ForEach(self.Grid,id: \.self){i in
                            
                            HStack(spacing: 20){
                                
                                ForEach(i...i+1,id: \.self){j in
                                    
                                    VStack{
                                        
                                        if j != self.data.count{
                                            
                                            Card(data: self.data[j])
                                        }
                                    }
                                }
                                
                                if i == self.Grid.last! && self.data.count % 2 != 0{
                                    
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

//class getData : ObservableObject {
//
//    @Published var data = [Type]()
//    @Published var count = 1
//
// ambil data selection clothes dr andimas
// @Publised var styles = [Style]()
//
//    init() {
//
//        updateData()
//    }
//
//    func updateData(){
//        let url = "http://18.140.3.202:8080/api/v1/user/find-reference"
//
//        let session = URLSession(configuration: .default)
//
//        body ambil data
//        let body : [String : cloth] = ["clothes" : clothes]
//
//        data diganti body,
//        session.dataTask(with: URL(string: url)!) { (data, , err) in
//            if err ! nil{
//                print((err?.localizedDescription)!)
//                return
//            }
//
//            do{
//                let res = JSONDecoder().decode(type: Decodeable.self, from: data!)
//
//                let oldstyles = self.styles
//
//                self.styles = oldstyles + res.response.types
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    func updateData(){
//        let url = "http://18.140.3.202:8080/api/v1/user/find-reference"
//
//        let request : URLRequest = URLRequest(url: url)
//
//        let session = URLSession(configuration: .default)
//
//        let body : [String : cloth] = ["clothes" : clothes]
//
//        request.httpMethod = "POST"
//        request.setValue(forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer \(accessToken)",forHTTPHeaderField: "Authorization")
//        request.httpBody = body //takut error
//
//        session.dataTask(with: request) { (body, response, err) in
//            if err ! nil{
//                print((err?.localizedDescription)!)
//                return
//            } udh dibikin
//
//            do{
//                let res = JSONDecoder().decode(type: Decodeable.self, from: data!)
//
//                let oldstyles = self.styles
//
//                self.styles = oldstyles + res.response.types
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }
//    }
//}

struct Detail : Decodable {
    
    var response : Response
}

struct Response : Decodable {
    
    var types : [Type]
}

struct Type : Decodable {
    
    var name : String
    var pic : String
    var price : String
}
