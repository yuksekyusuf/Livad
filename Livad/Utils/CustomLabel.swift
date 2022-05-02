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
    //    @State var country: Country
    var body: some View {
        HStack {
            Text("*").foregroundColor(.red)
            Image(systemName: imageName)
            placeHolder
            Text("| ⌵")
            
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
