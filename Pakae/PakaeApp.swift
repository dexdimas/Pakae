//
//  PakaeApp.swift
//  Pakae
//
//  Created by Andimas Bagaswara on 10/10/20.
//

import SwiftUI
import Firebase

@main
struct PakaeApp: App {
    let persistenceController = PersistenceController.shared
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            OnBoardingContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
