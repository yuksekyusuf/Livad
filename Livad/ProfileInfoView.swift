//
//  ContentView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 4/29/22.
//

import SwiftUI

enum Gender {
    case male
    case female
    case other
}

struct ProfileInfoView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var otherGender: String = ""
    @State var phone: String = ""
    @State var dobYear: Int = 0
    @State var dobMonth: Int = 0
    @State var dobDay: Int = 0
    @State var country: String = ""
    @State var city: String = ""
    @State var checkMale: Bool = false
    @State var checkFemale: Bool = false
    @State var checkOther: Bool = false
    @State var selectedCountry: Country?
//    = Country(id: "001", name: "Turkey")
    
    let countries = Locale.isoRegionCodes.compactMap {
        Country(id: $0, name: Locale.current.localizedString(forRegionCode: $0)!)}.sorted(by: { $0.name > $1.name })
    
    @State var selectedNumber: Int = 0
    
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    
    var body: some View {
        ZStack{
            Color("SignUpBackground")
                .ignoresSafeArea()
            VStack(alignment: .leading){
                CustomTextField(text: $firstName, placeHolder: Text("First Name"), imageName: "person")
                CustomTextField(text: $lastName, placeHolder: Text("Last Name"), imageName: "person")
                CustomTextField(text: $email, placeHolder: Text("E-mail"), imageName: "envelope")
                //Mark: - Gender
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "personalhotspot.circle")
                            .foregroundColor(.white)
                        Text("Gender").foregroundColor(.white) + Text(" *").foregroundColor(.red)
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 4)
                    HStack(spacing: 15) {
                        Image(systemName: checkMale ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(checkMale ? Color(UIColor.green) : Color.white)
                            .onTapGesture {
                                self.checkMale.toggle()
                            }
                        Text("Male")
                            .foregroundColor(.white)
                        
                        Spacer()
                        Image(systemName: checkFemale ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(checkFemale ? Color(UIColor.green) : Color.white)
                            .onTapGesture {
                                self.checkFemale.toggle()
                            }
                        Text("Female")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 32)
                    
                    HStack{
                        Image(systemName: checkOther ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(checkOther ? Color(UIColor.green) : Color.white)
                            .onTapGesture {
                                self.checkOther.toggle()
                            }
                        ZStack(alignment: .leading) {
                            if otherGender.isEmpty {
                                Text("In your own words, what is your gender identity?")
                                    .padding(.horizontal, 8)
                            }
                            TextField("", text: $otherGender )
                                .padding(.vertical, 18)
                                .padding(.horizontal, 8)
                        }
                        .background(Color.init(white: 1, opacity: 0.15))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 4)
                        //                    .padding(.vertical, 20)
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 10)
                }
                
                //Mark: - Phone
                
                HStack(spacing: 14){
//                    Menu {
//                        Picker(selection: $selectedCountry, label: EmptyView()) {
//                            ForEach(countries) {
//                                Text("\($0.name)")
//                            }
//                        }
//                    } label: {
//                        CustomLabel(imageName: "envelope", placeHolder: Text("Country"))
//                        }
                    
                    Menu {
                            Picker(selection: $selectedCountry, label: EmptyView()) {
                                ForEach(countries) {
                                    Text("\($0.name)")
                                }
                            }
                        } label: {
                            customLabel
                        }
                        
                    }
                    
                }
            }
            
            .background(Color("SignUpBackground"))
        }
    
    var customLabel: some View {
        HStack {
            Image(systemName: "paperplane")
            Text("\(selectedCountry.name)")
            Text("⌵")
                .offset(y: -4)
        }
        .padding()
        .background(Color.init(white: 1, opacity: 0.15))
        .cornerRadius(10)
        .foregroundColor(.white)
        .padding(.horizontal, 32)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
    
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .onTapGesture { configuration.isOn.toggle() }
                configuration.label
            }
            
        }
        .padding()
        .background(Color.init(white: 1, opacity: 0.15))
        .cornerRadius(10)
        .foregroundColor(.white)
        .padding(.horizontal, 32)
        
    }
}

struct Country: Identifiable, Hashable {
    let id: String
    var name: String
}



