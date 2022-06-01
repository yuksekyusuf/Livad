//
//  ProfileInfoViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

import Foundation
import Auth0

class ProfileInfoViewModel: ObservableObject {
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    var accessToken: String = ""
    
    @Published var setting = Setting(firstName: "", lastName: "", contactEmail: "", phone: "", discordUsername: "", gender: "", broadcastingLanguage: "", broadcastingLanguageID: "", country: "", city: "", instagramUsername: "", twitterUsername: "", birthDate: "", broadcastingSoftware: "", modSet: 0, countryID: "", countryName: "", cityID: 0, cityName: "", phoneCode: 0, setupPreviewConfirmed: "", birthDateDisplay: "", countryDisplay: CountryDisplay(value: "", label: ""), cityDisplay: Display(value: 0, label: ""), phoneCodeDisplay: Display(value: 0, label: ""))
    
    init() {
        handleCredentials()
    }
    
    func handleCredentials() {
        credentialsManager.credentials { result in
            switch result{
            case .success(let credentials):
                self.accessToken = credentials.accessToken
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
