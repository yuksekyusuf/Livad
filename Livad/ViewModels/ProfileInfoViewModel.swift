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
//    var accessToken: String = ""
    
    @Published var setting = Setting(firstName: "", lastName: "", contactEmail: "", phone: "", discordUsername: "", gender: "", broadcastingLanguage: "", genderDetail: "", broadcastingLanguageID: "", country: "", city: "", instagramUsername: "", twitterUsername: "", birthDate: "", broadcastingSoftware: "", modSet: 0, countryID: "", countryName: "", cityID: 0, cityName: "", phoneCode: 0, setupPreviewConfirmed: "", birthDateDisplay: "", countryDisplay: CountryDisplay(value: "", label: ""), cityDisplay: Display(value: 0, label: ""), phoneCodeDisplay: Display(value: 0, label: ""))
    
    init() {
        getCountries()
//        print("NEW TOKEN: \(accessToken)")
    }
    
    func handleCredentials(completion: @escaping (Credentials) -> Void) {
        credentialsManager.credentials { result in
            switch result{
            case .success(let credentials):
                completion(credentials)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    private func getCountries() {
        let url = "https://streamer.api.livad.stream/countries"
        handleCredentials { credentials in
            guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "GET", for: nil) else { return }
            let session = URLSession(configuration: URLSessionConfiguration.default)
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print("RESPONSE:", response)
                }
                if let data = data {
                    do {
                        let gitData = try JSONSerialization.jsonObject(with: data, options: [])
                        print(gitData)
                    } catch {
                        print("ERROR", error)
                    }
                }
            }.resume()
        }
        
        
    }
}