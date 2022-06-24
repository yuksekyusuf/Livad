//
//  ProfileInfoViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

import Foundation
import Auth0

class ProfileInfoViewModel: ObservableObject {
    @Published var setting = Setting(firstName: "", lastName: "", contactEmail: "", phone: "", discordUsername: "", gender: "", broadcastingLanguage: "", genderDetail: "", broadcastingLanguageID: "", country: "", city: "", instagramUsername: "", twitterUsername: "", birthDate: "", broadcastingSoftware: "", modSet: 0, countryID: "", countryName: "", cityID: 0, cityName: "", phoneCode: 0, setupPreviewConfirmed: "", birthDateDisplay: "", countryDisplay: CountryDisplay(value: "", label: ""), cityDisplay: Display(value: 0, label: ""), phoneCodeDisplay: Display(value: 0, label: ""))
    
    @Published var countries: [Country] = []
//    @Published var countryDictionary: [String: String]
    
    init() {
    }
    
    func getCountries(credentials: Credentials) {
        let url = "https://streamer.api.livad.stream/countries"
        guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "GET", for: nil) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("RESPONSE:", response)
            }
            if let data = data {
                do {
                    let resultCountries = try JSONDecoder().decode(CountryResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.countries.append(contentsOf: resultCountries.countries.values)
                        print("Country:", self.countries.count)
                        print("Country:", resultCountries.countries.first)
                    }
                } catch {
                    print("ERROR", error)
                }
            }
        }.resume()

        
        
    }
}


//    func handleCredentials(completion: @escaping (Credentials) -> Void) {
//        credentialsManager.credentials { result in
//            switch result{
//            case .success(let credentials):
//                completion(credentials)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
