//
//  ContentReferencePage.swift
//  Pakae
//
//  Created by Evan Renanto on 26/10/20.
//

import SwiftUI

struct ContentReferencePage: View {
    
    var body: some View {
        var photos : [[Int]] = []
        _ = (1...11).publisher
            .collect(2)
            .collect().sink(receiveValue: { photos = $0 })
        
        
        return ForEach(0..<photos.count, id: \.self) { collect in HStack(spacing: 10) {
            ForEach(photos[collect], id: \.self) {collection in
                Image("coba-\(collection)")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
            }
        }
        }
    }
}

struct ContentReferencePage_Previews: PreviewProvider {
    static var previews: some View {
        ContentReferencePage()
    }
}
