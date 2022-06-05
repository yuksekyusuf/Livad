//
//  LoginPageView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/23/22.
//

import SwiftUI
import Auth0

struct AuthenticationView: View {
    @StateObject var viewModel = AuthenticationViewModel()
    @EnvironmentObject var authService: AuthService
    var body: some View {
            if viewModel.isAuthenticated {
                ProfileInfoView()
                    .environmentObject(viewModel)
            } else {
                VStack{
                    HStack{
                        Image("LivadLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding()
                        Image("LivadHeader")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 35)
                    }
                    .padding(.top, 25)
                    .padding([.leading, .trailing], 50.0)
                    .background(.black)
                    Spacer()
                    VStack{
                        Text("Monetize your ")
                        Text("live streams with ")
                        Text("LIVAD's ").bold()
                        Text("non-intrusive ").bold().foregroundColor(Color("TextBlue"))
                        Text("video ads.")
                    }
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.system(size: 42))
                    .foregroundColor(.white)
                    
                    Text("Join our network of streamers and start earning today!")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    Button(action: {
                        let credentialManager = authService.credentialsManager
                        viewModel.postAction(credentialsManager: credentialManager)
                    }, label: {
                        Text("GET STARTED")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Capsule().fill(Color("TextBlue"))
                            )
                            .cornerRadius(15)
                    })
                    
                    //MARK: - LogOut
                    /*
                     Button(action: {
                     handleSignOut()
                     }, label: {
                     Text("LOG OUT")
                     .font(.headline)
                     .fontWeight(.semibold)
                     .foregroundColor(.white)
                     .padding()
                     .background(
                     Capsule().fill(Color("TextBlue"))
                     )
                     .cornerRadius(15)
                     })
                     */
                    
                    Spacer()
                    
                }
                .background(Color("SignUpBackground"))
                .ignoresSafeArea()
            }
        
//        .environmentObject(authenticationService)
        
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
