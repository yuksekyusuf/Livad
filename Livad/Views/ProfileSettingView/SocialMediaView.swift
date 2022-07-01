//
//  SwiftUIView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI


struct SocialMediaView: View {
    @EnvironmentObject var authService: AuthService
    var body: some View {
        
        ScrollView {
            VStack{
                CustomHeaderView(imageName: "person", text: "Discord")
            }
            Spacer()
            VStack(alignment: .leading) {
                CustomHeaderView(imageName: "person", text: "Twitter")
            }
            Spacer()
            VStack(alignment: .leading) {
                CustomHeaderView(imageName: "person", text: "Instagram")
            }
            Spacer()
            VStack(alignment: .leading) {
                CustomHeaderView(imageName: "person", text: "TikTok")
            }
        }
        .background(Color("SignUpBackground"))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaView()
    }
}
