//
//  SignUpTabView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI

struct SignUpTabView: View {
    
    @State var pageIndex = 0
    @StateObject var viewModel = SignUpTabViewModel()
    var body: some View {

        TabView(selection: $pageIndex) {
            ProfileInfoView(signUp: viewModel)
                .tag(0)
                .tabItem {
                    Image(systemName: "person.fill")
                }
            SocialMediaView(signUp: viewModel)
                .tag(1)
                .tabItem {
                    Image(systemName: "person.3.fill")
                }
            StreamSettingsView(signUp: viewModel)
                .tag(2)
                .tabItem {
                    Image(systemName: "character.book.closed")
                }
            InterestsView(signUp: viewModel)
                .tag(3)
                .tabItem {
                    Image(systemName: "suit.heart")
                }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .onAppear {
              setupAppearance()
            }
        .ignoresSafeArea()
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "TextBlue")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

struct SignUpTabView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTabView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}


