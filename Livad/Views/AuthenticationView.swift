//
//  LoginPageView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/23/22.
//

import SwiftUI
import Auth0

struct AuthenticationView: View {
//    @EnvironmentObject var authService: AuthService
    
    
    
    @StateObject var authService = AuthService()
    @StateObject var viewModel = AuthenticationViewModel()


    var body: some View {
        
        if viewModel.isAuthenticated && viewModel.loginData?.signupCompleted == 0 {
            MainDashboard()
                .environmentObject(authService)
        } else if viewModel.isAuthenticated && viewModel.loginData?.signupCompleted == 1 {
            SignUpTabView()
                .environmentObject(authService)
        } else {
            ZStack {
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
                        viewModel.handleButton(authService: authService)
                        
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
                .ignoresSafeArea()
                .background(Color("SignUpBackground"))
            }
        }
    }
    
//    func authenticationTapped() {
//        authService.handleAuthentication()
//    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
            .preferredColorScheme(.dark)
    }
}
