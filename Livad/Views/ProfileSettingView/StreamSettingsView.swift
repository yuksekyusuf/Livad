//
//  StreamSettings.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI
import Collections
import Auth0


struct StreamSettingsView: View {
    @StateObject var signUp: SignUpTabViewModel
    @StateObject var viewModel = StreamSettingsViewModel()
    @EnvironmentObject var authService: AuthService
    
    
    let languageColumns = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil)
    ]
    var body: some View {
        ScrollView {
            VStack{
                CustomHeaderView(imageName: "person", customImage: false, text: "Broadcasting Software", required: true)
                LazyVGrid(columns: languageColumns) {
                    ForEach(viewModel.softwares, id: \.self) { item in
                        CustomButtonView(placeHolder: item, imageName: "twitter-icon", downloadedImage: false)
                    }
                }
                .padding(.vertical)
            }
            Spacer()
            VStack {
                CustomHeaderView(imageName: "person", customImage: false, text: "Broadcasting Language", required: true)
//                LazyVGrid(columns: languageColumns) {
//                    ForEach(viewModel.newLanguages, id: \.self.id) { lang in
//                        CustomButtonView(placeHolder: lang.name, imageName: "twitter-icon")
//                    }
//                }
//                .padding(.vertical)
            }
            .padding()
        }
        .background(Color("SignUpBackground"))
        .onAppear(perform: getLanguages)
        }
    
    func getLanguages() {
        guard let credentials = authService.credentials else { return }
        viewModel.getLanguages(credentials: credentials)
    }
}

struct StreamSettings_Previews: PreviewProvider {
    static var previews: some View {
        StreamSettingsView(signUp: SignUpTabViewModel())
    }
}
