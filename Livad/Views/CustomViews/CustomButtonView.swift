//
//  CustomButtonView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import SwiftUI

struct CustomButtonView: View {
    
    let placeHolder: String
    let imageName: String?
    let downloadedImage: Bool
    var body: some View {
        HStack(spacing:0) {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
            
            Text("  \(placeHolder)")
                .font(.caption)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 150, height: 40)
        .background(
            Rectangle()
                .stroke(Color.gray, lineWidth: 2.0)
            //                .cornerRadius(12)
            //                .shadow(radius: 10)
        )
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(placeHolder: "Türkçe", imageName: "twitter-icon", downloadedImage: false)
    }
}
