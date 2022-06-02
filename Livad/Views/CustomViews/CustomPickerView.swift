//
//  CustomPickerView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/2/22.
//

import SwiftUI

struct CustomPickerView: View {
    //    let countries = Locale.isoRegionCodes.compactMap {
    //        Country(id: $0, name: Locale.current.localizedString(forRegionCode: $0)!)}.sorted(by: { $0.name > $1.name })
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
        //                HStack(spacing: 18){
        //                    Menu {
        //                        Picker(selection: $selectedCountr1, label: EmptyView()) {
        //                            ForEach(countries) { country in
        //                                Text("\(country.name)").tag(Optional(country))
        //                            }
        //                        }
        //                    } label: {
        //                        HStack {
        //                            if let selectedCountry = selectedCountr1 {
        //                                Text("\(selectedCountry.name)")
        //                            } else {
        //                                Text("Day")
        //                            }
        //                            Text("⌵")
        //                        }
        //                    }
        //                    .padding()
        //                    .background(Color.init(white: 1, opacity: 0.15))
        //                    .cornerRadius(10)
        //                    .foregroundColor(.white)
        //
        //                    Menu {
        //                        Picker(selection: $selectedCountr1, label: EmptyView()) {
        //                            ForEach(countries) { country in
        //                                Text("\(country.name)").tag(Optional(country))
        //                            }
        //                        }
        //                    } label: {
        //                        HStack {
        //                            if let selectedCountry = selectedCountr1 {
        //                                Text("\(selectedCountry.name)")
        //                            } else {
        //                                Text("Month")
        //                            }
        //                            Text("⌵")
        //                        }
        //                    }
        //                    .padding()
        //                    .background(Color.init(white: 1, opacity: 0.15))
        //                    .cornerRadius(10)
        //                    .foregroundColor(.white)
        //
        //                    Menu {
        //                        Picker(selection: $selectedCountr1, label: EmptyView()) {
        //                            ForEach(countries) { country in
        //                                Text("\(country.name)").tag(Optional(country))
        //                            }
        //                        }
        //                    } label: {
        //                        HStack {
        //                            if let selectedCountry = selectedCountr1 {
        //                                Text("\(selectedCountry.name)")
        //                            } else {
        //                                Text("Year")
        //                            }
        //                            Text("⌵")
        //                        }
        //                    }
        //                    .padding()
        //                    .background(Color.init(white: 1, opacity: 0.15))
        //                    .cornerRadius(10)
        //                    .foregroundColor(.white)
        //                }
        
        
        
        //Mark: - Country
        //                HStack{
        //                    Menu {
        //                        Picker(selection: $selectedCountr1, label: EmptyView()) {
        //                            ForEach(countries) { country in
        //                                Text("\(country.name)").tag(Optional(country))
        //                            }
        //                        }
        //                    } label: {
        //                        customLabel
        //                    }
        //                    Spacer()
        //                    Menu {
        //                        Picker(selection: $selectedCountr2, label: EmptyView()) {
        //                            ForEach(countries) { country in
        //                                Text("\(country.name)").tag(Optional(country))
        //                            }
        //                        }
        //                    } label: {
        //                        customLabel2
        //                    }
        //                }
        //                .padding(.horizontal, 32)
        //                .allowsTightening(false)
        
        
        //    var customLabel: some View {
        //        HStack {
        //            Image(systemName: "paperplane")
        //            Text("*").foregroundColor(.red)
        //            if let selectedCountry = selectedCountr1 {
        //                Text("\(selectedCountry.name)")
        //            } else {
        //                Text("Country")
        //            }
        //            Text("⌵")
        //                .offset(y: -4)
        //        }
        //        .padding(15)
        //        .background(Color.init(white: 1, opacity: 0.15))
        //        .cornerRadius(10)
        //        .foregroundColor(.white)
        //    }
        //
        //var customLabel2: some View {
        //    HStack {
        //        Image(systemName: "building.2")
        //        Text("*").foregroundColor(.red)
        //        if let selectedCountry = selectedCountr2 {
        //            Text("\(selectedCountry.name)")
        //        } else {
        //            Text("City")
        //        }
        //        Text("⌵")
        //            .offset(y: -4)
        //    }
        //    .padding(15)
        //    .background(Color.init(white: 1, opacity: 0.15))
        //    .cornerRadius(10)
        //    .foregroundColor(.white)
        //}
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerView()
    }
}
