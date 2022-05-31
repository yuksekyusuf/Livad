//
//  LoginPageView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/23/22.
//

import SwiftUI
import Auth0

struct HomePageView: View {
    @State private var isRegistered: Bool = false
    //    @StateObject var viewModel = HomePageViewModel()
    var body: some View {
        NavigationView {
            if isRegistered {
                ProfileInfoView()
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
                        handleLogin()
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
                    
                    //            Button("Log Out") {
                    //                handleLogOut()
                    //            }
                    //            .foregroundColor(.white)
                    //                .padding()
                    //                .background(.blue)
                    Spacer()
                }
                .background(Color("SignUpBackground"))
                .ignoresSafeArea()
            }
        }
    }
    
    func handleLogin(){
        Auth0
            .webAuth()
            .start { result in
                switch result {
                case .success(let credentials):
                    print("TOKEN", credentials.accessToken)
                    postAction(credentials: credentials)
                case .failure(let error):
                    print("Failed with: \(error)")
                }
            }
    }
    func postAction(credentials: Credentials) {
        let url = String(format: "https://streamer.livad.stream/streamers")
        guard let serviceUrl = URL(string: url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(credentials.accessToken)",
            forHTTPHeaderField: "Authentication"
        )
        request.httpBody = try! JSONSerialization.data(withJSONObject: [])
    
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print("RESPONSE:", response)
            }
            if let data = data {
                do {
                    print(data)
                    let gitData = try JSONDecoder().decode(LoginData.self, from: data)
                    print(gitData.currencyID)
                } catch {
                    print("ERROR", error)
                }
            }
        }.resume()
    }

}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
