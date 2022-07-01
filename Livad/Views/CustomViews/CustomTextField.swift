//
//  CustomTextField.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 4/30/22.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeHolder: Text
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeHolder
                    .foregroundColor(Color.init(white: 1, opacity: 0.8))
            }
            TextField("", text: $text)
        }
        .padding()
        .background(Color.init(white: 1, opacity: 0.15))
        .cornerRadius(10)
        .foregroundColor(.white)
        .padding(.horizontal, 32)
    }
    
}

//struct Previews_CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField(text: .constant(""), placeHolder: Text("Email"))
//    }
//}
