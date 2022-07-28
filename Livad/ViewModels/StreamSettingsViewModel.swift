//
//  StreamSettingsViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import Foundation
import Auth0
import Collections

class StreamSettingsViewModel: ObservableObject {
    
    let softwares: [SoftwareModel] = [
        SoftwareModel("OBS"),
        SoftwareModel("Streamlabs"),
        SoftwareModel("Twitch Studio"),
        SoftwareModel("Other")
    ]
    @Published var languages: [Language] = []
    
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
                    let jsonData = try JSONDecoder().decode(LanguageResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.languages.append(contentsOf: jsonData.languages)
                        print("Languages: ", self.languages[0].flagURL)
                    }
                    
                } catch {
                    print("language ERROR", error)
                }
            }
        }.resume()
    }
    
    func selectSoftware(_ software: SoftwareModel) {
        softwares.forEach { $0.isSelected = false
        }
        software.isSelected = true
        objectWillChange.send()
    }
    
    func selectLanguage(_ language: Language) {
        languages.indices.forEach { languages[$0].isSelected = false }
        language.isSelected = true
        objectWillChange.send()
    }
    
    func softwareName(name: String) -> String {
        switch name {
        case "Twitch Studio":
            return "twitch_studio"
        case "OBS":
            return "obs"
        case "Streamlabs":
            return "streamlabs"
        case "Other":
            return "other"
        default:
            return ""
        }
    }
    
}


class SoftwareModel {
    let name: String
    var isSelected: Bool = false
    init(_ name: String) {
        self.name = name
    }
}
