//
//  ContentView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 4/29/22.
//

import SwiftUI
import Auth0


struct ProfileInfoView: View {
    @EnvironmentObject var authService: AuthService
    @StateObject var viewModel = ProfileInfoViewModel()
    @State var genderChecked: [String: Bool] = ["male": false,
                                                "female": false,
                                                "other": false]
    @State var phone: String = ""
    @State var dobYear: Int = 0
    @State var dobMonth: Int = 0
    @State var dobDay: Int = 0
    @State var city: String = ""
    @State var phoneNumber = ""
    @State var code = ""

    
    
    var body: some View {
        ScrollView{
            Color("SignUpBackground")
                .ignoresSafeArea()
            VStack(alignment: .leading){
                CustomHeaderView(imageName: "person", text: "First Name")
                CustomTextField(text: $viewModel.setting.firstName, placeHolder: Text("First Name"))
                CustomHeaderView(imageName: "person", text: "Last Name")
                CustomTextField(text: $viewModel.setting.lastName, placeHolder: Text("Last Name"))
                CustomHeaderView(imageName: "envelope", text: "E-mail")
                CustomTextField(text: $viewModel.setting.contactEmail, placeHolder: Text("E-mail"))
                
                //Mark: - Gender
                VStack(alignment: .leading) {
                    CustomHeaderView(imageName: "personalhotspot.circle", text: "Gender")
                    HStack(spacing: 15) {
                        CheckboxFieldView(genderChecked: $genderChecked, genderName: "male")
                        Spacer()
                        CheckboxFieldView(genderChecked: $genderChecked, genderName: "female")
                        Spacer()
                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 32)
                    
                    HStack{
                        CheckboxFieldView(genderChecked: $genderChecked, genderName: "other")
                        CustomTextField(text: $viewModel.setting.genderDetail, placeHolder: Text("In your own words, what is your \ngender identity?"))
                            .onTapGesture {
                                self.genderChecked.keys.forEach { genderChecked[$0] = false }
                                self.genderChecked["other"]!.toggle()
                            }
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 10)
                }
                
                VStack(alignment: .leading) {
                    
                    CustomHeaderView(imageName: "phone.fill", text: "Phone")
                    HStack{
                        //Country Code
                        CustomTextField(text: $viewModel.setting.firstName, placeHolder: Text("Code"))
                            .frame(height: 20)
                        CustomTextField(text: $viewModel.setting.firstName, placeHolder: Text("Phone"))
                            .frame(width: 300)
                        
                    }
                    
                }
                //MARK: - DOB
                
                VStack(alignment: .leading) {
                    CustomHeaderView(imageName: "heart.fill", text: "Date of Birth")
                    HStack{
                        //Year
                        //Month
                        //Day
                    }
                    
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        CustomHeaderView(imageName: "paperplane", text: "Country")
                        
                        Button {
                            getCountries()
                        } label: {
                            Text("Coutry")
                                .padding()
                                .background(.blue)
                                .foregroundColor(.white)
                        }

                        //Country
                        //City
                    }
                }
            }
        }
        .background(Color("SignUpBackground"))
    }
    
    func getCountries() {
        guard let credentials = authService.credentials else { return }
        viewModel.getCountries(credentials: credentials)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
    
}


