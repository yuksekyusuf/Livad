//
//  StreamSettings.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI

struct StreamSettingsView: View {
    var body: some View {
        ScrollView {
            VStack{
                CustomHeaderView(imageName: "person", text: "Broadcasting Software")
            }
            Spacer()
            VStack(alignment: .leading) {
                CustomHeaderView(imageName: "person", text: "Broadcasting Language")
            }
        }
        .background(Color("SignUpBackground"))
    }
}

struct StreamSettings_Previews: PreviewProvider {
    static var previews: some View {
        StreamSettingsView()
    }
}
