//
//  ContentView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 4/29/22.
//

import SwiftUI

struct ProfileInfoView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var gender: String = ""
    @State var phone: String = ""
    @State var dobYear: Int = 0
    @State var dobMonth: Int = 0
    @State var dobDay: Int = 0
    @State var country: String = ""
    @State var city: String = ""
    @State var status: Bool = false
    var body: some View {
        ZStack{
            Color("SignUpBackground")
                .ignoresSafeArea()
        VStack(alignment: .leading){
            CustomTextField(text: $firstName, placeHolder: Text("First Name"), imageName: "person.fill")
            
            
           CustomTextField(text: $lastName, placeHolder: Text("Last Name"), imageName: "person.fill")

            //Gender
            
            CustomTextField(text: $phone, placeHolder: Text("Phone"), imageName: "phone.fill")
            
            HStack{
                Toggle(isOn: $status) {
                            Text("toggle 1")
                        }.toggleStyle(CheckboxToggleStyle())
                Toggle(isOn: $status) {
                            Text("toggle 2")
                        }.toggleStyle(CheckboxToggleStyle())
            }
            
            
        }
        .background(Color("SignUpBackground"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State var checked = false
    static var previews: some View {
        ProfileInfoView()
    }

}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            HStack {
                configuration.label
                Spacer()
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .onTapGesture { configuration.isOn.toggle() }
                
            }
            
        }
        .padding()
        .background(Color.init(white: 1, opacity: 0.15))
        .cornerRadius(10)
        .foregroundColor(.white)
        .padding(.horizontal, 32)
        
    }
}
