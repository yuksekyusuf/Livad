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
    @State var genderChecked: [String: Bool] = ["Male": false,
                                                "Female": false,
                                                "Other": false]
    @State var phone: String = ""
    @State var phoneCode = ""
    @State var phoneNumber = ""
    @State var year = ""
    @State var month = ""
    @State var day = ""
    
    var body: some View {
        ZStack {
            ScrollView{
                VStack(alignment: .leading){
                    //MARK: - Streamer Info
                    CustomHeaderView(imageName: "person", text: "First Name")
                    CustomTextField(text: $viewModel.streamer.firstName, placeHolder: Text("First Name"))
                    CustomHeaderView(imageName: "person", text: "Last Name")
                    CustomTextField(text: $viewModel.streamer.lastName, placeHolder: Text("Last Name"))
                    CustomHeaderView(imageName: "envelope", text: "E-mail")
                    CustomTextField(text: $viewModel.streamer.contactEmail, placeHolder: Text("E-mail"))
                        .textCase(.lowercase)
                    
                    //MARK: - Gender
                    VStack(alignment: .leading) {
                        CustomHeaderView(imageName: "personalhotspot.circle", text: "Gender")
                        HStack(spacing: 15) {
                            boxBuilder(gender: "Male")
                                .onTapGesture {
                                    genderToggle(gender: "Male")
                                }
                            Spacer()
                            boxBuilder(gender: "Female")
                                .onTapGesture {
                                    genderToggle(gender: "Female")
                                }
                            Spacer()
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 32)
                        HStack{
                            boxBuilder(gender: "Other")
                                .onTapGesture {
                                    genderToggle(gender: "Other")
                                }
                            CustomTextField(text: $viewModel.streamer.genderDetail, placeHolder: Text("In your own words, \nwhat is your gender identity?"))
                                .padding(.horizontal, -27.0)
                                .onTapGesture {
                                    genderToggle(gender: "Other")
                                }
                                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.small/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical, 10)
                    }
                    //MARK: - Phone
                    VStack(alignment: .leading) {
                        CustomHeaderView(imageName: "phone.fill", text: "Phone")
                        HStack {
                            CustomPickerMenuView(options: self.viewModel.phoneDictionary.map({"+\($0.value) \($0.key)"}).sorted(by: >), selectedOption: $phoneCode)
                                .padding(.horizontal, 27)
                                .padding(.trailing, 20)
                                .onChange(of: phoneCode) { newValue in
                                    let array = phoneCode.components(separatedBy: " ")
                                    phoneCode = array[0]
                                    viewModel.streamer.phone = phoneCode + phoneNumber
                                    viewModel.streamer.phoneCode = phoneCode
                                }
                            Spacer()
                            CustomTextField(text: $phoneNumber, placeHolder: Text("Number"))
                                .padding(.leading, -65)
    //                            .padding(.trailing, 5)
                                .onChange(of: phoneNumber) { _ in viewModel.streamer.phone = phoneCode + phoneNumber }
                        }
                    }
                    //MARK: - DOB
                    VStack(alignment: .leading) {
                        CustomHeaderView(imageName: "heart.fill", text: "Date of Birth")
                        HStack{
                            VStack{
                                Text("Year").foregroundColor(.white) + Text(" *").foregroundColor(.red)
                                CustomPickerMenuView(options: viewModel.getYears(), selectedOption: $year)
    //                                .padding(.horizontal)
                                    .onChange(of: year) { _ in createBirthday() }
                            }
                            Spacer()
                            VStack{
                                Text("Month").foregroundColor(.white) + Text(" *").foregroundColor(.red)
                                CustomPickerMenuView(options: viewModel.getMonths(), selectedOption: $month)
                                    .onChange(of: month) { newValue in
                                        let array = viewModel.getMonths()
                                        guard let index = array.firstIndex(where: {$0 == month}) else { return }
                                        month = String(index + 1)
                                        createBirthday()
                                    }
                            }
                            VStack{
                                Text("Day").foregroundColor(.white) + Text(" *").foregroundColor(.red)
                                CustomPickerMenuView(options: viewModel.getDays(), selectedOption: $day)
    //                                .padding(.horizontal, 15)
                                    .onChange(of: day) { _ in createBirthday() }
                            }
                            
                        }
                        .padding(.horizontal)
                    }
                    //MARK: - Country
                    VStack(alignment: .leading) {
                        HStack {
                            VStack {
                                CustomHeaderView(imageName: "paperplane", text: "Country")
                                CustomPickerMenuView(options: viewModel.countries.map({$0.name}).sorted{$0>$1},
                                                     selectedOption: $viewModel.streamer.country)
                                .padding(.horizontal, 25)
                                .onChange(of: viewModel.streamer.country, perform: { _ in
                                    viewModel.streamer.countryID = viewModel.countryDictionary[viewModel.streamer.country] ?? ""
                                    print("Country:", viewModel.streamer.country)
                                    print("CountryID:", viewModel.streamer.countryID)
                                getCities(country_id: viewModel.streamer.countryID)
                                })
                            }
                            VStack {
                                CustomHeaderView(imageName: "building.2", text: "City")
                                CustomPickerMenuView(options: viewModel.cities, selectedOption: $viewModel.streamer.city)
                                    .padding(.horizontal, 25)

                            }
                        }
                    }
                    .padding(.vertical)
                }
                
            }
            
        }
        .background(Color("SignUpBackground"))
//        .onAppear(perform: getCountries)
//        .onDisappear(perform: putStreamer)
    }
        
    //MARK: - Helper Functions
    func getCountries() {
        guard let credentials = authService.credentials else { return }
        viewModel.getCountries(credentials: credentials)
    }
    
    func getCities(country_id: String) {
        guard let credentials = authService.credentials else { return }
        viewModel.getCities(credentials: credentials, country_id: country_id)
    }
    
    func genderToggle(gender: String) {
        self.genderChecked.keys.forEach { genderChecked[$0] = false }
        self.genderChecked[gender]!.toggle()
        viewModel.streamer.gender = gender
    }
    
    @ViewBuilder func boxBuilder(gender: String) -> some View {
            HStack {
                Image(systemName: genderChecked[gender]! ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(genderChecked[gender]! ? Color(UIColor.green) : Color.white)
                Text(gender.capitalized)
                    .foregroundColor(.white)
            }
    }
    
    func createBirthday() {
        viewModel.streamer.birthDate = "\(year)-\(month)-\(day)"
    }
    
    func putStreamer() {
        guard let credentials = authService.credentials else { return }
        viewModel.putStreamer(credentials: credentials)

    }
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
}


