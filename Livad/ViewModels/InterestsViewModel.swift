//
//  InterestsViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/5/22.
//

import Foundation
import Auth0

class InterestsViewModel: ObservableObject {
    
    @Published var interests: [Interest] = []
    
    init() {}
    
    func getInterests(credentials: Credentials) {
        let url = "https://streamer.api.livad.stream/interests"
        guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "GET", for: nil) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("RESPONSE:", response)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(Interests.self, from: data)
                    DispatchQueue.main.async {
                        self.interests.append(contentsOf: data.data)
                    }
                } catch {
                    print("ERROR", error)
                }
            }
        }.resume()
    }
    
    
}
