//
//  PakaeApp.swift
//  Pakae
//
//  Created by Andimas Bagaswara on 10/10/20.
//

import SwiftUI

@main
struct PakaeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SignInWithAppleButton()
        }
    }
}
