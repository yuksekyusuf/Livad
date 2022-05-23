//
//  LoginPageView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/23/22.
//

import SwiftUI
import Auth0

struct LoginPageView: View {
    var body: some View {
        VStack {
            Button("Login") {
                handleLogin()
            }.foregroundColor(.white)
                .padding()
                .background(.blue)
            Button("Log Out") {
                handleLogOut()
            }
            .foregroundColor(.white)
                .padding()
                .background(.blue)
        }
        

    }
    func handleLogin(){
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
    
    func handleLogOut() {
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

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
