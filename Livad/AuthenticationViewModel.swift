//
//  AuthenticationViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/1/22.
//

import Foundation
import Auth0

class AuthenticationViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var loginData: LoginData? = nil
 
    
    func handleButton(authService: AuthService) {
        authService.handleAuthentication {
            let url = "https://streamer.api.livad.stream/streamers"
            guard let credentials = authService.credentials else { return }
            guard let request = LivadService.shared.actionSession(with: url, credentials: credentials, action: "POST", for: nil) else { return }
            let session = URLSession(configuration: URLSessionConfiguration.default)
            session.dataTask(with: request) { (data, response, error) in
                if let response = response {
                    print("RESPONSE:", response)
                }
                if let data = data {
                    do {
                        let data = try JSONDecoder().decode(LoginData.self, from: data)
                        print("HERE DATA", data)
                        DispatchQueue.main.async {
                            self.loginData = data
                            self.isAuthenticated = true

                        }
                    } catch {
                        print("ERROR", error)
                    }
                }
            }.resume()
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
}
