//
//  OpenSafari.swift
//  Pakae
//
//  Created by Evan Renanto on 10/11/20.
//

import SwiftUI
import SafariServices

struct OpenSafari: View {
    var body: some View {
        Safari()
    }
}

struct OpenSafari_Previews: PreviewProvider {
    static var previews: some View {
        OpenSafari()
    }
}

struct Safari : UIViewControllerRepresentable {

    func makeUIViewController (context: UIViewControllerRepresentableContext<Safari>) -> SFSafariViewController {
        
        let controller = SFSafariViewController(url: URL(string: "http://loonatheworld.com/")!)
        controller.preferredBarTintColor = UIColor.white
        return controller
    }
    
    func updateUIViewController(_ UIViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<Safari>) {
        
    }
}
