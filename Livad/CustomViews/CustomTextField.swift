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
    let imageName: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: imageName)
                    .foregroundColor(.white)
                placeHolder
                    .foregroundColor(.white) + Text(" *").foregroundColor(.red)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 32)
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    placeHolder
                        .foregroundColor(Color.init(white: 1, opacity: 0.8))
                        .padding(.leading, 10)
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
}

struct Previews_CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeHolder: Text("Email"), imageName: "circle")
    }
}
