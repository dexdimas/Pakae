//
//  MLDetection.swift
//  Pakae
//
//  Created by Stendy Antonio on 04/11/20.
//

import SwiftUI

struct MLDetection: View {
    
//    let image = UIImage(data: )
    
    var body: some View {
        
        VStack{
                    
//            Image(uiImage: image)
            
            Spacer()
            
            VStack(alignment:.leading){
                Text("TurnOver Collar Shirt")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.leading)
                
                
                Text("Slim Fit")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                    .padding(.leading)
                
                HStack{
                    Text("Color         :")
                    Text("Blue")
                }
                .padding(.leading)
                
                
                HStack{
                    Text("Pattern      :")
                    Text("Basic")
                }.padding(.bottom)
                .padding(.leading)
                
                
                Button(action: {
                    
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
            .position(x: 190,y: 650)
            .padding()
            
        }
        
        
        
        
    }
}

struct MLDetection_Previews: PreviewProvider {
    static var previews: some View {
        MLDetection()
    }
}
