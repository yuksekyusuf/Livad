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
    @State var phoneNumber1 = ""
    @State var phoneNumber2 = ""
    @State var code = ""
    @State var year = ""
    @State var month = ""
    @State var day = ""
    
    
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
                        CustomTextField(text: $viewModel.setting.genderDetail, placeHolder: Text("In your own words, what is your gender identity?"))
                            .padding(.horizontal, -27.0)
                            .onTapGesture {
                                self.genderChecked.keys.forEach { genderChecked[$0] = false }
                                self.genderChecked["other"]!.toggle()
                            }
                            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.small/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 10)
                }
                
                VStack(alignment: .leading) {
                    
                    CustomHeaderView(imageName: "phone.fill", text: "Phone")
                    HStack {
                        CustomPickerMenuView(options: self.viewModel.countryPhones, selectedOption: $phoneNumber1)
                            .padding(.leading, 20)
                        
    //
                        
                        CustomTextField(text: $phoneNumber2, placeHolder: Text("Number"))
                            
                            .padding(.leading, -15)
                            .padding(.trailing, 5)
                    }
                    
                }
                //MARK: - DOB
                
                VStack(alignment: .leading) {
                    CustomHeaderView(imageName: "heart.fill", text: "Date of Birth")
                    HStack{
                        VStack{
                            Text("Year").foregroundColor(.white) + Text(" *").foregroundColor(.red)
                            CustomPickerMenuView(options: viewModel.getYears(), selectedOption: $year)
                                .padding(.horizontal)
                        }
                        Spacer()
                        VStack{
                            Text("Month").foregroundColor(.white) + Text(" *").foregroundColor(.red)
                            CustomPickerMenuView(options: viewModel.getMonths(), selectedOption: $month)
                        }
                        VStack{
                            Text("Day").foregroundColor(.white) + Text(" *").foregroundColor(.red)
                            CustomPickerMenuView(options: viewModel.getDays(), selectedOption: $day)
                                .padding(.horizontal, 15)
                        }
                        
                    }
                    .padding(.horizontal)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            CustomHeaderView(imageName: "paperplane", text: "Country")
                            CustomPickerMenuView(options: viewModel.countries.map({$0.name}).sorted{$0>$1}, selectedOption: $viewModel.setting.country)
                                .padding(.horizontal)
//                                .onChange(of: viewModel.setting.country, perform: { _ in
//                                    DispatchQueue.main.async {
//                                        viewModel.setting.countryID = viewModel.countryDictionary[viewModel.setting.country] ?? ""
//                                    }
//                                    guard let country_id = Int(viewModel.setting.countryID) else { return }
//                                    getCities(country_id: country_id)
//
//                                })
                            Text("\(viewModel.setting.country)  \(viewModel.countryDictionary[viewModel.setting.country] ?? "")")
                        }
                        VStack {
                            CustomHeaderView(imageName: "building.2", text: "City")
                            CustomPickerMenuView(options: viewModel.cities.map({ $0.name}), selectedOption: $viewModel.setting.city)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .background(Color("SignUpBackground"))
        .onAppear {
                                   getCountries()
                               }
    }
    
    
    
    
    
    func getCountries() {
        guard let credentials = authService.credentials else { return }
        viewModel.getCountries(credentials: credentials)
    }
    
    func getCities(country_id: Int) {
        guard let credentials = authService.credentials else { return }
        viewModel.getCities(credentials: credentials, country_id: country_id)
    }
    
    //MARK: - Helpers
    
//    func getCountryCode (_ country : String) -> String
//        {
//            if let key = countryDictionary.first(where: { $0.value == country })?.key {
//                return key
//            }
//            return ""
//        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
    
}


