//
//  BookmarkPage.swift
//  Pakae
//
//  Created by Evan Renanto on 31/10/20.
//

import SwiftUI

struct BookmarkPage: View {
    
    @State private var fnb = 0
    var choose = ["Outfit", "Items"]
    
    var body: some View {
        VStack{
            
            HStack{
                
                HStack{
                    
                    Text("My Favorite").font(.title)
                }
                
                Spacer()
                
                HStack{
                    Image("coba-1")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(70)
                }
            }.frame(width: 380)
            
            Spacer()
            
            Picker(selection: $fnb, label: Text("What is your favorite color?")) {
                ForEach(0..<choose.count) { index in
                    Text(self.choose[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            .frame(width: 350)
            .padding(50)
            .foregroundColor(.blue)
            .offset(y: -30)
            
            Spacer()
            
//            if(choose.tag == 0){
//
//            }else if(choose.tag == 1){
//
//            }
            
            Home1()
                .offset(y: -60)
            
        }
    }
}

struct BookmarkPage_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkPage()
    }
}

struct Home1 : View {
    
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


struct Card1 : View {
    
    var data : Type1
    
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

struct MainView1 : View {
    
    //    @ObservedObject var listData = getData()
    
    @Binding var data : [Type1]
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
                                            
                                            Card1(data: self.data[j])
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

struct Type1 : Decodable {
    
    var name : String
    var pic : String
    var price : String
}
