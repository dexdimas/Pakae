//
//  WardrobeListView.swift
//  Pakae
//
//  Created by Andimas Bagaswara on 27/10/20.
//

import SwiftUI

struct WardrobeListView: View {
    
    var gridItems: [GridItem] = [GridItem(), GridItem()]
    
    var body: some View {
        
        LazyVGrid(columns: gridItems, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, pinnedViews: [.sectionHeaders], content: {
            
            Section(header: headerView()) {
                
                ForEach((1...6), id: \.self) { number in
                    
                    VStack {
                        if number == 1 {
                            
                            Rectangle()
                                .overlay(
                                    Image(systemName: "plus").foregroundColor(.black)
                                )
                                .foregroundColor(.white)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            
                        } else {
                            
                            Image("coba-\(number)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        }
                    }
                }
            }
        })
        .padding()
    }
}

func headerView() -> some View {
    Section {
        HStack(alignment: .center, spacing: nil, content: {
            Text("All")
            Spacer()
            Text("Tops")
            Spacer()
            Text("Bottoms")
        })
        .background(Color.white)
    }
}

struct WardrobeListView_Previews: PreviewProvider {
    static var previews: some View {
        WardrobeListView()
    }
}
