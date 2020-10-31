//
//  STLViewItem.swift
//  Pakae
//
//  Created by Evan Renanto on 31/10/20.
//

import SwiftUI

struct STLViewItem: View {
    @State private var didTap1:Bool = true
    @State private var didTap2:Bool = true
    @State var bookmarkButton:String = "bookmark"
    @State var tagButton:String = "tag"
    
    var body: some View {
        
        VStack{
            ZStack{
                
                Image("coba-7").resizable()
                    .frame(width: 450, height: 450)
                
                VStack{
                    Spacer()
                    HStack{
                        Button(action: {
                            if(didTap1 == true) {
                                self.tagButton = "tag.fill"
                                didTap1 = false
                            } else if (didTap1 == false) {
                                self.tagButton = "tag"
                                didTap1 = true
                            }
                        }, label: {
                            Image(systemName: tagButton).resizable().frame(width: 25, height: 25, alignment: .center)
                        }).frame(width: 40, height: 40).background(Color.white).cornerRadius(30)
                        Spacer()
                    }
                }.frame(width: 250, height: 400)
            }
            
            HStack{
                VStack{
                    HStack{
                        Text("Monochrome").font(.title2).bold().foregroundColor(.red)
                        Spacer()
                    }
                    HStack{
                        Text("Meeting Attire Outfit by SevenSeas").font(.callout)
                        Spacer()
                    }
                }
                
                Button(action: {
                    if(didTap2 == true) {
                        self.bookmarkButton = "bookmark.fill"
                        didTap2 = false
                    } else if (didTap2 == false) {
                        self.bookmarkButton = "bookmark"
                        didTap2 = true
                    }
                }, label: {
                    Image(systemName: bookmarkButton).resizable().frame(width: 20, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }).frame(width: 40, height: 40).background(Color.white).cornerRadius(30)
            }.frame(width: 350)
            
            Spacer()
            
            HStack{
                Text("Description").font(.title3)
                Spacer()
            }.frame(width: 350)
            
            HStack{
                Text("The night that’s become dark again, My room that’s all square and straight, Feels like I’m trapped in it again, At that moment, something knocks on my window, The moonlight that shines on me, And curls around me").font(.caption)
                Spacer()
            }.frame(width: 350)
            
            Spacer()
            
            HStack{
                VStack{
                    HStack{
                        Text("Price").font(.title3)
                        Spacer()
                    }
                }
                Text("Rp. 69900").font(.callout).bold()
            }.frame(width: 350)
            
            HStack{
                NavigationView{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Buy Now")
                            .frame(width: 350, height: 40)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(10.0)
                    })
                }
            }
        }
    }
}

struct STLViewItem_Previews: PreviewProvider {
    static var previews: some View {
        STLViewItem()
    }
}
