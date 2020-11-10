//
//  ShopTheLookPage.swift
//  Pakae
//
//  Created by Evan Renanto on 26/10/20.
//

import SwiftUI

struct ShopTheLookPage: View {
    
    @State private var didTap1:Bool = true
    @State var bookmarkButton:String = "star"
    @State var tagButton:String = "tag"
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                ZStack{
                    
                    Image("coba-1").resizable()
                        .frame(width: 660, height: 665)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            VStack{
                                
                                Image("coba-2").resizable()
                                    .frame(width: 80, height: 80)
                                Image("coba-3").resizable()
                                    .frame(width: 80, height: 80)
                                Image("coba-4").resizable()
                                    .frame(width: 80, height: 80)
                            }.padding()
                            
                            Spacer()
                        }
                        
                    }.frame(width: 390, height: 600)
                }
                
                HStack{
                    
                    VStack{
                        
                        HStack{
                            
                            VStack{
                                
                                HStack{
                                    
                                    Image(systemName: "bag")
                                    Text("Girl of the Month")
                                        .font(.custom("Poppins-SemiBold", size: 15))
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                if(didTap1 == true) {
                                    self.bookmarkButton = "star.fill"
                                    didTap1 = false
                                } else if (didTap1 == false) {
                                    self.bookmarkButton = "star"
                                    didTap1 = true
                                }
                            }, label: {
                                Image(systemName: bookmarkButton).resizable().frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }).frame(width: 35, height: 35).background(Color.white).cornerRadius(30)
                        }
                        
                        HStack{
                            
                            Text("Monochrome")
                                .font(.custom("Poppins-SemiBold", size: 20))
                            
                            Spacer()
                        }
                        
                        HStack{
                            
                            Text("Rp 749,900")
                                .font(.custom("Poppins-Regular", size: 15))
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                    }
                }.frame(width: 350)
                .offset(y: -20)
                
                Spacer()
                
                HStack{
                    
                    Text("Product Description")
                        .font(.custom("Poppins-SemiBold", size: 20))
                    Spacer()
                }.frame(width: 350)
                .offset(y: -20)
                
                HStack{
                    
                    Text("The night that’s become dark again, My room that’s all square and straight, Feels like I’m trapped in it again, At that moment, something knocks on my window, The moonlight that shines on me, And curls around me")
                        .font(.custom("Poppins-Regular", size: 15))
                    
                    Spacer()
                }.frame(width: 350)
                .offset(y: -20)
                
                Spacer()
                
                HStack{
                    
                    Text("Compare to My Wardrobe")
                        .font(.custom("Poppins-SemiBold", size: 20))
                    
                    Spacer()
                }.frame(width: 350)
                .offset(y: -20)
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack{
                        
                        Image("coba-6").resizable()
                            .frame(width: 220, height: 250)
                        Image("coba-7").resizable()
                            .frame(width: 220, height: 250)
                        Image("coba-8").resizable()
                            .frame(width: 220, height: 250)
                        Image("coba-9").resizable()
                            .frame(width: 220, height: 250)
                        Image("coba-10").resizable()
                            .frame(width: 220, height: 250)
                        Image("coba-11").resizable()
                            .frame(width: 220, height: 250)
                    }
                    
                }.frame(width: 400, height: 250)
                .offset(y: -20)
                
            }.offset(y: -75)
        }
    }
}

struct ShopTheLookPage_Previews: PreviewProvider {
    static var previews: some View {
        ShopTheLookPage()
    }
}
