//
//  BookmarkPage.swift
//  Pakae
//
//  Created by Evan Renanto on 31/10/20.
//

import SwiftUI

struct BookmarkPage: View {
    
    @State private var fnb = 0
    
    var body: some View {
        VStack{
            Text("My Favorite").font(.title)
            
            Spacer()
            
            Picker(selection: $fnb, label: Text("What is your favorite color?")) {
                Text("Outfit").tag(0)
                Text("Items").tag(1)
            }.pickerStyle(SegmentedPickerStyle()).frame(width: 350)
            .padding(50)
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Spacer()
                    ContentReferencePage()
                }.padding()
            }
        }
    }
}

struct BookmarkPage_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkPage()
    }
}
