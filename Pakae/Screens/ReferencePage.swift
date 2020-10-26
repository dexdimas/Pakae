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
        NavigationView{
            VStack {
                Text("Rerefence").font(.title)
                if self.selected == 0 {
                    NavigationLink(
                        destination: ShopTheLookPage(),
                        isActive: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/,
                        label: {
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack {
                                    Spacer()
                                    ContentReferencePage()
                                }.padding()
                            }
                        })
                }
            }
        }
    }
}

struct FindReferencePage_Previews: PreviewProvider {
    static var previews: some View {
        ReferencePage()
    }
}
