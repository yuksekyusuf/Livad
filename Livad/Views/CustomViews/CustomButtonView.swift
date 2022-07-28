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
    let isSelected: Bool
    var body: some View {
        HStack(spacing:0) {
            if let imageName = imageName {
                if downloadedImage {
                    AsyncImage(url: URL(string: imageName)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .leading)
                            .foregroundColor(.white)
                        
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .leading)
                        .foregroundColor(.white)
                }
            }
            Text("  \(placeHolder)")
                .font(.caption)
                .foregroundColor(.white)
                .frame(alignment: .leading)
        }
        .padding(10)
        .frame(width: 150, height: 40, alignment: .leading)
        .background(isSelected ? Color("TextBlue") : Color("SignUpBackground"))
        .cornerRadius(10)
        .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(lineWidth: 1.0)
                    .foregroundColor(.white)
            )
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(placeHolder: "Türkçe", imageName: "twitter-icon", downloadedImage: false, isSelected: false)
            .preferredColorScheme(.dark)
    }
}
