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
    

    let columns = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil)
    ]
    var body: some View {
        ScrollView {
            VStack{
                CustomHeaderView(imageName: "desktopcomputer", customImage: false, text: "Broadcasting Software", required: true)
                
                LazyVGrid(columns: columns) {
                    
                    ForEach(viewModel.softwares, id: \.name) { software in
                        CustomButtonView(placeHolder: software.name, imageName: software.name, downloadedImage: false, isSelected: software.isSelected)
                            .onTapGesture {
                                withAnimation {
                                    self.viewModel.selectSoftware(software)
                                    self.signUp.streamer.broadcastingSoftware = viewModel.softwareName(name: software.name)
                                }
                                
                            }
                    }
    
                }
                .padding(.vertical)
            }
            Spacer()
            VStack {
                CustomHeaderView(imageName: "character.book.closed", customImage: false, text: "Broadcasting Language", required: true)
    
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.newLanguages, id: \.id) { language in
                        CustomButtonView(placeHolder: language.name, imageName: language.flagURL, downloadedImage: true, isSelected: language.isSelected)
                            .onTapGesture {
                                withAnimation {
                                    self.viewModel.selectLanguage(language)
                                    self.signUp.streamer.languagePreference = language.id
                                }
                            }
                    }
                    
                }
                .padding(.vertical)
                
            }
            .padding()
        }
        .background(Color("SignUpBackground"))
//        .onAppear{
//            if viewModel.newLanguages.isEmpty {
//                getLanguages()
//            }
//        }
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
