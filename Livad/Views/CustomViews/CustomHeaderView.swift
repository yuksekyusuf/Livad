//
//  CustomHeaderView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/2/22.
//

import SwiftUI

struct CustomHeaderView: View {
    let imageName: String
    let text: String
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .foregroundColor(.white)
            Text(text).foregroundColor(.white) + Text(" *").foregroundColor(.red)
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 4)
    }
}
//
//struct CustomHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomHeaderView()
//    }
//}
