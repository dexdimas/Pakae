//
//  PasswordLessThanLabel.swift
//  Pakae
//
//  Created by Stendy Antonio on 23/10/20.
//

import SwiftUI

struct PasswordLessThanLabel: View {
    var body: some View {
        HStack{
            Text("Password Less than 6 Characters")
                .foregroundColor(Color.red)
                .font(.system(size: 10))
            
            Spacer()

        }.padding(5)
    }
}
