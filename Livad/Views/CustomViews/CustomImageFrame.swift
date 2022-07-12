//
//  CustomImageFrame.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/7/22.
//

import SwiftUI

struct CustomImageFrame: View {
    let url: String
    let placeHolder: String
    let isSelected: Bool
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .if(isSelected) { view in
                        view.frame(width: 85, height: 85, alignment: .center)
                    }
            } placeholder: {
                ProgressView()
            }
            if isSelected {
                ZStack {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .bold))
                        .shadow(radius: 10)
                    Image(systemName: "circle")
                        .foregroundColor(Color("TextBlue"))
                        .font(.system(size: 30, weight: .bold))
                        .shadow(radius: 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
        .frame(width: 100, height: 100)
        .overlay(Circle().strokeBorder(lineWidth: 1).foregroundColor(.white).frame(width: 100, height: 100, alignment: .center))
    }
}

struct CustomImageFrame_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageFrame(url: "https://static-cdn.jtvnw.net/user-default-pictures-uv/75305d54-c7cc-40d1-bb9c-91fbe85943c7-profile_image-300x300.png", placeHolder: "Yusuf", isSelected: true)
            .preferredColorScheme(.dark)
    }
}


extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
