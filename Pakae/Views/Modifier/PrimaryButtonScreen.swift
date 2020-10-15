//
//  PrimaryButtonScreen.swift
//  Pakae
//
//  Created by Andimas Muhammad Bagaswara on 15/10/20.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .buttonStyle(PlainButtonStyle())
            .frame(width: UIScreen.main.bounds.width * 0.936, height: UIScreen.main.bounds.height * 0.0578817734, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .circular)
                    .fill(Color.blue)
            )
    }
}

#if DEBUG
struct PrimaryButtonModifier_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("Continue") {
                
            }
            .primaryButton()
            .environment(\.colorScheme, .light)
            .previewDisplayName("Light Mode")
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
#endif
