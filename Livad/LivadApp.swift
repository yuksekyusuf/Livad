//
//  LivadApp.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 4/29/22.
//

import SwiftUI
import Auth0

//final class CredentialsController: ObservableObject {
//    init() {
//    }
//    @Published var credentialsManager = CredentialsManager(authentication: Auth0.authentication())
//}

@main
struct LivadApp: App {
//    @StateObject var credentialsController = CredentialsController()

    var body: some Scene {
        WindowGroup {
//            ProfileInfoView()
            HomePageView()
//                .environmentObject(credentialsController)
        }
    }
        
}
