//
//  InterestsView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI

struct InterestsView: View {
    var body: some View {
        ZStack {
            VStack{
                CustomHeaderView(imageName: "person", text: "Interests (Pick Between 3-5)")
            }
        }
        .ignoresSafeArea()
        .background(Color("SignUpBackground"))
    }

    
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView().preferredColorScheme(.dark)
    }
}
