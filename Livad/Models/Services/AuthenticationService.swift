//
//  AuthenticationService.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/3/22.
//

import Foundation
import Auth0
import SwiftUI

class AuthenticationService: ObservableObject {
    
    @Published var credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    @Published var credentials: Credentials? = nil
    init() {
        handleAuthentication()
        retriveCredentials()
    }
    
    func handleAuthentication() {
        Auth0
            .webAuth()
            .scope("openid profile offline_access")
            .audience("https://streamer.api.livad.stream")
            .start { result in
                
                switch result {
                case .success(let credential):
                    self.credentialsManager.store(credentials: credential)
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    
    func retriveCredentials(){
        credentialsManager.credentials { result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.credentials = result
                }
            case .failure(let error):
                print("Failed with: \(error)")
            }
        }
    }
    
    
}
