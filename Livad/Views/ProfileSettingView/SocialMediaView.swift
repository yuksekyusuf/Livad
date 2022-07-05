//
//  SwiftUIView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI


struct SocialMediaView: View {
    @StateObject var signUp: SignUpTabViewModel
    var body: some View {
        
        ScrollView {
            Spacer()
            VStack(alignment: .leading){
                CustomHeaderView(imageName: "discord-icon", customImage: true, text: "Discord", required: true)
                CustomTextField(text: $signUp.streamer.discordUsername, placeHolder: Text("Username#0000"))
            }
            Spacer()
            VStack(alignment: .leading) {
                CustomHeaderView(imageName: "twitter-icon", customImage: true, text: "Twitter", required: false)
                CustomTextField(text: $signUp.streamer.twitterUsername, placeHolder: Text("Username"))
            }
            Spacer()
            VStack(alignment: .leading) {
                CustomHeaderView(imageName: "instagram-icon", customImage: true, text: "Instagram", required: false)
                CustomTextField(text: $signUp.streamer.instagramUsername, placeHolder: Text("Username"))
            }
            Spacer()
            VStack(alignment: .leading) {
                CustomHeaderView(imageName: "twitter-icon", customImage: true, text: "Twitter", required: false)
                CustomTextField(text: $signUp.streamer.instagramUsername, placeHolder: Text("Username"))
            }
        }
        .background(Color("SignUpBackground"))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SocialMediaView(signUp: SignUpTabViewModel())
    }
}
