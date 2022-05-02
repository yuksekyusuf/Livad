//
//  CustomLabel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/2/22.
//

import SwiftUI

struct CustomLabel: View {
    let imageName: String
    let placeHolder: Text
    @State var selectedText: String?
    var body: some View {
        HStack {
            Image(systemName: imageName)
            if let selectedText = selectedText {
                Text("\(selectedText)")
            } else {
                placeHolder
            }
            Text("⌵")
                .offset(y: -4)
        }
        .padding()
        .background(Color.init(white: 1, opacity: 0.15))
        .cornerRadius(10)
        .foregroundColor(.white)
        .padding(.horizontal, 32)
    }
}

//struct CustomLabel_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var name: String
//        CustomLabel(text: name, imageName: "envelope", placeHolder: "Country")
//    }
//}
