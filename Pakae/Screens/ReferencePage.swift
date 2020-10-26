//
//  ReferencePage.swift
//  Pakae
//
//  Created by Evan Renanto on 26/10/20.
//

import SwiftUI

struct ReferencePage: View {
    
    @State var selected = 0
    
    var body: some View {
        VStack {
            Text("Rerefence").font(.title)
            if self.selected == 0 {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Spacer()
                        ContentReferencePage()
                    }.padding()
                }
            }
        }.onTapGesture {
            print("BISA DONG BISA")
        }
    }
}

struct FindReferencePage_Previews: PreviewProvider {
    static var previews: some View {
        ReferencePage()
    }
}
