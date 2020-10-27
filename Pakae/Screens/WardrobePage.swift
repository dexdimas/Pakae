//
//  WardrobePage.swift
//  Pakae
//
//  Created by Andimas Bagaswara on 27/10/20.
//

import SwiftUI

struct WardrobePage: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack(alignment: .center, spacing: nil, content: {
                WardrobeListView()
            })
            .navigationTitle("My Wardrobe")
            
        })
        .embedNavigationView()
    }
}

struct WardrobePage_Previews: PreviewProvider {
    static var previews: some View {
        WardrobePage()
    }
}
