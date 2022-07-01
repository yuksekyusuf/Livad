//
//  AuthenticationService.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/3/22.
//

import Foundation
import Auth0
import SwiftUI

class AuthService: ObservableObject {
    @Published var credentials: Credentials? = nil
    
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    init() {
        handleAuthentication()
    }
    
    func handleAuthentication() {
        Auth0
            .webAuth()
            .scope("openid profile offline_access")
            .audience("https://streamer.api.livad.stream")
            .start { result in
                switch result {
                case .success(let credential):
                    DispatchQueue.main.async {
                        self.credentialsManager.store(credentials: credential)
                        self.credentials = credential
                    }
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
}

