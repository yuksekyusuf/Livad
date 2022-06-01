//
//  AuthenticationViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

import Foundation
import Auth0

class AuthenticationViewModel: ObservableObject {
    
    init() {}
    
    @Published var isAuthenticated: Bool = false
    
    func handleLogin(){
        Auth0
            .webAuth()
            .audience("https://streamer.api.livad.stream")
            .start { result in
                switch result {
                case .success(let credentials):
                    self.postAction(credentials: credentials)
                    self.isAuthenticated = true
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func handleSignOut() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success:
                    print("Logged out")
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    
    private func postAction(credentials: Credentials) {
        let url = "https://streamer.api.livad.stream/streamers"
        guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "POST", for: nil) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("RESPONSE:", response)
            }
            if let data = data {
                do {
                    let gitData = try JSONDecoder().decode(LoginData.self, from: data)
                    print(gitData.currencyID)
                } catch {
                    print("ERROR", error)
                }
            }
        }.resume()
    }
    
    
}
