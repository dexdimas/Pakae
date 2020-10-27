//
//  TabBarPage.swift
//  Pakae
//
//  Created by Andimas Bagaswara on 22/10/20.
//

import SwiftUI

struct TabBarPage: View {
    var body: some View {
        TabView {
            WelcomePage()
                .tabItem {
                    Image(systemName: "tray.fill")
                    Text("Wardrobe")
                }
            SignInPage()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Favorite")
                }
            SignUpPage()
                .tabItem {
                    Image(systemName: "cloud.fill")
                    Text("Inspiration")
                }
        }
    }
}

struct TabBarPage_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPage()
    }
}
