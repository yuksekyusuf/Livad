//
//  LivadApp.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 4/29/22.
//

import SwiftUI
import Auth0


@main
struct LivadApp: App {
//    @StateObject var authenticationService = AuthService()
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
//                .environmentObject(authenticationService)
        }
    }
        
}

