//
//  View+Extensions.swift
//  Pakae
//
//  Created by Andimas Bagaswara on 10/10/20.
//

import Foundation
import SwiftUI

extension View {
    
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
    
    func primaryButton() -> ModifiedContent<Self, PrimaryButtonModifier> {
        return modifier(PrimaryButtonModifier())
    }
}
