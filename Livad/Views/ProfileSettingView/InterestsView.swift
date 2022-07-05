//
//  InterestsView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI
import Auth0



struct InterestsView: View {
    @EnvironmentObject var authService: AuthService
    @StateObject var viewModel = InterestsViewModel()
    let languageColumns = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil)
    ]
    
    
    var body: some View {
        ZStack {
            VStack{
                CustomHeaderView(imageName: "person", customImage: false, text: "Interests (Pick Between 3-5)", required: true)
                LazyVGrid(columns: languageColumns) {
                    ForEach(viewModel.interests, id: \.id) { item in
                        CustomButtonView(placeHolder: item.name, imageName: item.image, downloadedImage: true)
                    }
                }
                .padding(.vertical)
            }
        }
        .ignoresSafeArea()
        .background(Color("SignUpBackground"))
        .onAppear(perform: getInterests)
    }
    
    func getInterests() {
        guard let credentials = authService.credentials else { return }
        viewModel.getInterests(credentials: credentials)
    }
    
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView().preferredColorScheme(.dark)
    }
}
