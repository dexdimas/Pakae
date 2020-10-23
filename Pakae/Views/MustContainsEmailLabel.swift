//
//  MustContainsEmailLabel.swift
//  Pakae
//
//  Created by Stendy Antonio on 23/10/20.
//

import SwiftUI

struct MustContainsEmailLabel: View {
    var body: some View {
        HStack{
            Text("\"Must Containt @\"")
                .foregroundColor(Color.red)
                .font(.system(size: 10))
            
            Spacer()

        }.padding(5)
    }
}

struct MustContainsEmailLabel_Previews: PreviewProvider {
    static var previews: some View {
        MustContainsEmailLabel()
    }
}
