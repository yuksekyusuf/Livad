//
//  SignUpViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import Foundation

class SignUpTabViewModel: ObservableObject {
    
    @Published var streamer = Streamer(firstName: "", lastName: "", contactEmail: "", phone: "", discordUsername: "", broadcastingLanguage: "", broadcastingLanguageID: "", gender: "", country: "", instagramUsername: "", twitterUsername: "", city: "", birthDate: "", broadcastingSoftware: "", languagePreference: "", countryID: "", phoneCode: "", genderDetail: "", setupPreviewConfirmed: 0)
    
    init() {
    }
    
}
