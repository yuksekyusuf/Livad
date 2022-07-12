//
//  InterestsView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 7/1/22.
//

import SwiftUI
import Auth0



struct InterestsView: View {
    @EnvironmentObject var authService: AuthService
    @StateObject var viewModel = InterestsViewModel()
    @StateObject var signUp: SignUpTabViewModel
    @State private var selected: Bool = false
    let columns = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil)
    ]
    
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack{
                    CustomHeaderView(imageName: "heart.fill", customImage: false, text: "Interests (Pick Between 3-5)", required: true)
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.interests.indices, id: \.self) { i in
                            VStack{
                                CustomImageFrame(url: viewModel.interests[i].image, placeHolder: viewModel.interests[i].name, isSelected: viewModel.interests[i].isSelected)
                                    .onTapGesture {
                                        withAnimation {
                                            viewModel.interests[i].isSelected.toggle()
                                        }
                                    }
                                Text(viewModel.interests[i].name)
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(maxHeight: .infinity, alignment: .bottom)
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .ignoresSafeArea()
            
        }
        .background(Color("SignUpBackground"))
//        .onAppear{
//            if viewModel.interests.isEmpty {
//                self.getInterests()
//            }
//        }
    }
    
    func getInterests() {
        guard let credentials = authService.credentials else { return }
        viewModel.getInterests(credentials: credentials)
    }
    
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView(signUp: SignUpTabViewModel()).preferredColorScheme(.dark)
    }
}
