//
//  ContentView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 4/29/22.
//

import SwiftUI
import Auth0

enum Gender {
    case male
    case female
    case other
}

struct ProfileInfoView: View {
    
    @StateObject var viewModel = ProfileInfoViewModel()
    
    @State var otherGender: String = ""
    @State var phone: String = ""
    @State var dobYear: Int = 0
    @State var dobMonth: Int = 0
    @State var dobDay: Int = 0
    @State var country: String = ""
    @State var city: String = ""
    @State var genderChecked: [String: Bool] = ["male": false,
                                                "female": false,
                                                "other": false]
//    @State var checkMale: Bool = false
//    @State var checkFemale: Bool = false
//    @State var checkOther: Bool = false
    @State var selectedCountr1: Country?
    @State var selectedCountr2: Country?
    
    @State var phoneNumber = ""
    @State var code = ""
    @ObservedObject var codeTextField = ObservableTextField()
    
    let countries = Locale.isoRegionCodes.compactMap {
        Country(id: $0, name: Locale.current.localizedString(forRegionCode: $0)!)}.sorted(by: { $0.name > $1.name })
    var body: some View {
        ScrollView{
            Color("SignUpBackground")
                .ignoresSafeArea()
            VStack(alignment: .leading){
                CustomTextField(text: $viewModel.setting.firstName, placeHolder: Text("First Name"), imageName: "person")
                CustomTextField(text: $viewModel.setting.lastName, placeHolder: Text("Last Name"), imageName: "person")
                CustomTextField(text: $viewModel.setting.contactEmail, placeHolder: Text("E-mail"), imageName: "envelope")
                
                //Mark: - Gender
                VStack(alignment: .leading) {
                    CustomHeaderView(imageName: "personalhotspot.circle", text: "Gender")
                    HStack(spacing: 15) {
                        Image(systemName: genderChecked["male"]! ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(genderChecked["male"]! ? Color(UIColor.green) : Color.white)
                            .onTapGesture {
                                self.genderChecked.keys.forEach { genderChecked[$0] = false }
                                self.genderChecked["male"]!.toggle()
                            }
                        Text("Male")
                            .foregroundColor(.white)
                        
                        Spacer()
                        Image(systemName: genderChecked["female"]! ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(genderChecked["female"]! ? Color(UIColor.green) : Color.white)
                            .onTapGesture {
                                self.genderChecked.keys.forEach { genderChecked[$0] = false }
                                self.genderChecked["female"]!.toggle()
                            }
                        Text("Female")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 32)
                    
                    HStack{
                        Image(systemName: genderChecked["other"]! ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(genderChecked["other"]! ? Color(UIColor.green) : Color.white)
                            .onTapGesture {
                                self.genderChecked.keys.forEach { genderChecked[$0] = false }
                                self.genderChecked["other"]!.toggle()
                            }
                        ZStack(alignment: .leading) {
                            if viewModel.setting.genderDetail.isEmpty {
                                Text("In your own words, what is your gender identity?")
                                    .padding(.horizontal, 8)
                            }
                            TextField("", text: $viewModel.setting.genderDetail )
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
                
                VStack(alignment: .leading) {
                    
                    CustomHeaderView(imageName: "phone.fill", text: "Phone")
                    
                    HStack{
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).stroke()
                                            .frame(width: 270, height: 50)
                                        HStack (spacing: 0) {
                                            HStack (spacing: 0) {
                                                Text("\(flag(country: getCountryCode(codeTextField.value)))")
                                                    .frame(width: 30, height: 50)
                                                
                                                TextField("+1", text: $codeTextField.value)
                                                    .keyboardType(.phonePad)
                                                    .frame(width: 40, height: 50)
                                            }
                                            .background(Color.secondary.opacity(0.2))
                                            .cornerRadius(10)
                                            
                                            TextField("Phone Number", text: $phoneNumber)
                                                .padding()
                                                .frame(width: 200, height: 50)
                                                .keyboardType(.phonePad)
                                            
                                        }.padding()
                        }
                        
                        
                        
                        
//                        Menu {
//                            Picker(selection: $selectedCountr1, label: EmptyView()) {
//                                ForEach(countries) { country in
//                                    Text("\(country.id)").tag(Optional(country))
//                                }
//                            }
//                        } label: {
//                            customLabel
//                        }
                        
//                        ZStack(alignment: .leading) {
//                            if phone.isEmpty {
//                                Text("Phone")
//                                    .padding(.horizontal, 8)
//                            }
//                            TextField("", text: $phone )
//                                .padding(.vertical, 15)
//                                .padding(.horizontal, 8)
//                        }
//                        .background(Color.init(white: 1, opacity: 0.15))
//                        .cornerRadius(10)
//                        .foregroundColor(.white)
                    }
                    .padding(.horizontal, 32)
                    
                    
                }
                //MARK: - DOB
                CustomHeaderView(imageName: "heart.fill", text: "Date of Birth")
                
                HStack(spacing: 18){
                    Menu {
                        Picker(selection: $selectedCountr1, label: EmptyView()) {
                            ForEach(countries) { country in
                                Text("\(country.name)").tag(Optional(country))
                            }
                        }
                    } label: {
                        HStack {
                            if let selectedCountry = selectedCountr1 {
                                Text("\(selectedCountry.name)")
                            } else {
                                Text("Day")
                            }
                            Text("⌵")
                        }
                    }
                    .padding()
                    .background(Color.init(white: 1, opacity: 0.15))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                    Menu {
                        Picker(selection: $selectedCountr1, label: EmptyView()) {
                            ForEach(countries) { country in
                                Text("\(country.name)").tag(Optional(country))
                            }
                        }
                    } label: {
                        HStack {
                            if let selectedCountry = selectedCountr1 {
                                Text("\(selectedCountry.name)")
                            } else {
                                Text("Month")
                            }
                            Text("⌵")
                        }
                    }
                    .padding()
                    .background(Color.init(white: 1, opacity: 0.15))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                    Menu {
                        Picker(selection: $selectedCountr1, label: EmptyView()) {
                            ForEach(countries) { country in
                                Text("\(country.name)").tag(Optional(country))
                            }
                        }
                    } label: {
                        HStack {
                            if let selectedCountry = selectedCountr1 {
                                Text("\(selectedCountry.name)")
                            } else {
                                Text("Year")
                            }
                            Text("⌵")
                        }
                    }
                    .padding()
                    .background(Color.init(white: 1, opacity: 0.15))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
                
                .padding(.horizontal, 32)
                .allowsTightening(false)
                
                
                //Mark: - Country
                HStack{
                    Menu {
                        Picker(selection: $selectedCountr1, label: EmptyView()) {
                            ForEach(countries) { country in
                                Text("\(country.name)").tag(Optional(country))
                            }
                        }
                    } label: {
                        customLabel
                    }
                    Spacer()
                    Menu {
                        Picker(selection: $selectedCountr2, label: EmptyView()) {
                            ForEach(countries) { country in
                                Text("\(country.name)").tag(Optional(country))
                            }
                        }
                    } label: {
                        customLabel2
                    }
                }
                .padding(.horizontal, 32)
                .allowsTightening(false)
            }
            
            
        }
        .background(Color("SignUpBackground"))
    }
    var customLabel: some View {
        HStack {
            Image(systemName: "paperplane")
            Text("*").foregroundColor(.red)
            if let selectedCountry = selectedCountr1 {
                Text("\(selectedCountry.name)")
            } else {
                Text("Country")
            }
            Text("⌵")
                .offset(y: -4)
        }
        .padding(15)
        .background(Color.init(white: 1, opacity: 0.15))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
    
    var customLabel2: some View {
        HStack {
            Image(systemName: "building.2")
            Text("*").foregroundColor(.red)
            if let selectedCountry = selectedCountr2 {
                Text("\(selectedCountry.name)")
            } else {
                Text("City")
            }
            Text("⌵")
                .offset(y: -4)
        }
        .padding(15)
        .background(Color.init(white: 1, opacity: 0.15))
        .cornerRadius(10)
        .foregroundColor(.white)
    }
    
    let countryDictionary  = ["AF":"93","AL":"355","DZ":"213","US":"1",
                                  "AD":"376","AO":"244","AI":"1","AG":"1","AR":"54",
                                  "AM":"374","AW":"297","AU":"61","AT":"43","AZ":"994",
                                  "BS":"1","BH":"973","BD":"880","BB":"1","BY":"375",
                                  "BE":"32","BZ":"501","BJ":"229","BM":"1","BT":"975",
                                  "BA":"387","BW":"267","BR":"55","IO":"246","BG":"359",
                                  "BF":"226","BI":"257","KH":"855","CM":"237","CA":"1",
                                  "CV":"238","KY":"345","CF":"236","TD":"235","CL":"56","CN":"86",
                                  "CX":"61","CO":"57","KM":"269","CG":"242","CK":"682","CR":"506",
                                  "HR":"385","CU":"53","CY":"537","CZ":"420","DK":"45","DJ":"253",
                                  "DM":"1","DO":"1","EC":"593","EG":"20","SV":"503","GQ":"240",
                                  "ER":"291","EE":"372","ET":"251","FO":"298","FJ":"679","FI":"358",
                                  "FR":"33","GF":"594","PF":"689","GA":"241","GM":"220","GE":"995",
                                  "DE":"49","GH":"233","GI":"350","GR":"30","GL":"299","GD":"1",
                                  "GP":"590","GU":"1","GT":"502","GN":"224","GW":"245","GY":"595","HT":"509",
                                  "HN":"504","HU":"36","IS":"354","IN":"91","ID":"62","IQ":"964",
                                  "IE":"353","IL":"972","IT":"39","JM":"1","JP":"81","JO":"962",
                                  "KZ":"77","KE":"254","KI":"686","KW":"965","KG":"996","LV":"371",
                                  "LB":"961","LS":"266","LR":"231","LI":"423","LT":"370","LU":"352",
                                  "MG":"261","MW":"265","MY":"60","MV":"960","ML":"223",
                                  "MT":"356","MH":"692","MQ":"596","MR":"222","MU":"230","YT":"262",
                                  "MX":"52","MC":"377","MN":"976", "ME":"382","MS":"1","MA":"212",
                                  "MM":"95","NA":"264","NR":"674","NP":"977","NL":"31","NC":"687",
                                  "NZ":"64","NI":"505","NE":"227","NG":"234","NU":"683",
                                  "NF":"672","MP":"1","NO":"47","OM":"968","PK":"92","PW":"680",
                                  "PA":"507","PG":"675","PY":"595","PE":"51","PH":"63","PL":"48",
                                  "PT":"351","PR":"1","QA":"974","RO":"40","RW":"250","WS":"685",
                                  "SM":"378","SA":"966","SN":"221","RS":"381","SC":"248",
                                  "SL":"232","SG":"65","SK":"421","SI":"386","SB":"677",
                                  "ZA":"27","GS":"500","ES":"34","LK":"94","SD":"249","SR":"597",
                                  "SZ":"268","SE":"46","CH":"41","TJ":"992","TH":"66","TG":"228",
                                  "TK":"690","TO":"676","TT":"1","TN":"216","TR":"90",
                                  "TM":"993","TC":"1","TV":"688","UG":"256","UA":"380",
                                  "AE":"971","GB":"44","AS":"1","UY":"598","UZ":"998",
                                  "VU":"678","WF":"681","YE":"967","ZM":"260",
                                  "ZW":"263","BO":"591","BN":"673","CC":"61",
                                  "CD":"243","CI":"225","FK":"500","GG":"44",
                                  "VA":"379","HK":"852","IR":"98","IM":"44",
                                  "JE":"44","KP":"850","KR":"82","LA":"856",
                                  "LY":"218","MO":"853","MK":"389","FM":"691",
                                  "MD":"373","MZ":"258","PS":"970","PN":"872",
                                  "RE":"262","RU":"7","BL":"590","SH":"290","KN":"1",
                                  "LC":"1","MF":"590","PM":"508","VC":"1","ST":"239",
                                  "SO":"252","SJ":"47","SY":"963","TW":"886","TZ":"255",
                                  "TL":"670","VE":"58","VN":"84","VG":"284","VI":"340"]
    
//    func countryName(countryCode: String) -> String? {
//        let current = Locale(identifier: "en_US")
//        return current.localizedString(forRegionCode: countryCode)
//    }
//
    func getCountryCode (_ country : String) -> String
    {
        if let key = countryDictionary.first(where: { $0.value == country })?.key {
            return key
        }
        return ""
    }
    func flag(country:String) -> String {
            let base : UInt32 = 127397
            var flag = ""
            for v in country.unicodeScalars {
                flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
            }
            return flag
        }
    
//    func handleCredentials() {
//        viewModel.credentialsManager.credentials { result in
//            switch result{
//            case .success(let credentials):
//                accessToken = credentials.accessToken
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
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

class ObservableTextField: ObservableObject {
    
    @Published var value = "" {
        didSet {
            if value.count > 3 {
                value = String(value.prefix(3))
            }
        }
    }
    
}



