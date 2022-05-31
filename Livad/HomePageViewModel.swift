//
//  HomePageViewModel.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/31/22.
//

import Foundation
import Auth0


class HomePageViewModel: ObservableObject {
    
//    var setting: Setting
    func handleLogin() {
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    print("Obtained credentials: \(credentials)")
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
    
    
}
