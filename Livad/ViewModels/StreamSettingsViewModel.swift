//
//  StreamSettingsViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import Foundation
import Auth0

class StreamSettingsViewModel: ObservableObject {
//
//    let languages : OrderedDictionary = ["中国人": "zh",
//                     "Deutsch": "de",
//                     "English": "en",
//                     "Español": "es",
//                     "Français": "fr",
//                     "Italiano": "it",
//                     "日本": "ja",
//                     "한국인": "ko",
//                     "Nederlands": "nl",
//                     "Português": "pt",
//                     "Pусский": "rus",
//                     "Türkçe": "tr"
//    ]
    
    let softwares = ["OBS", "Streamlabs", "Twitch Studio", "Other"]
    
    
    @Published var newLanguages: [Language] = []
    init() {
        
    }
    
    func getLanguages(credentials: Credentials) {
        let url = "https://streamer.api.livad.stream/languages"
        guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "GET", for: nil) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("Language RESPONSE:", response)
            }
            if let data = data {
                print("DATA", data)
                do {
                    let jsonData = try JSONDecoder().decode([Language].self, from: data)
                    print("DATA RESULT:", jsonData)
                } catch {
                    print("language ERROR", error)
                }
            }
        }.resume()
    }
    
}
