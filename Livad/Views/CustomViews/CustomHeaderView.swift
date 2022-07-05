//
//  CustomHeaderView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/2/22.
//

import SwiftUI

struct CustomHeaderView: View {
    let imageName: String
    let customImage: Bool
    let text: String
    let required: Bool
    var body: some View {
        HStack{
            if customImage {
                if required {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    Text(text).foregroundColor(.white) + Text(" *").foregroundColor(.red)
                } else {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    Text(text).foregroundColor(.white)
                }
            } else {
                if required {
                    Image(systemName: imageName)
                        .foregroundColor(.white)
                    Text(text).foregroundColor(.white) + Text(" *").foregroundColor(.red)

                } else {
                    Image(systemName: imageName)
                        .foregroundColor(.white)
                    Text(text).foregroundColor(.white)
                }
            }
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
