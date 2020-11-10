//
//  ViewOnWebsiteButton.swift
//  Pakae
//
//  Created by Evan Renanto on 06/11/20.
//

import SwiftUI

struct ViewOnWebsiteButton: View {
    
    @State var show = false
    
    var body: some View {
        Button(action: {
            
            self.show.toggle()
            
        }, label: {
            
            Text("View On Website")
                
                .frame(width: 350, height: 40)
                
                .foregroundColor(.white)
                
                .background(Color.gray)
                
                .cornerRadius(10.0)
            
        }).fullScreenCover(isPresented: $show) {
            OpenSafari().edgesIgnoringSafeArea(.all).background(Color.white)

        }
    }
}

struct ViewOnWebsiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ViewOnWebsiteButton()
    }
}




