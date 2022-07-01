//
//  SignUpTabView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI

struct SignUpTabView: View {
    @State var pageIndex = 0
    var body: some View {
        TabView(selection: $pageIndex) {
            ProfileInfoView()
                .tag(0)
            SocialMediaView()
                .tag(1)
            StreamSettingsView()
                .tag(2)
            InterestsView()
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

struct SignUpTabView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTabView()
            .preferredColorScheme(.dark)
    }
}


