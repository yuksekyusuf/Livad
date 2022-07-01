//
//  PhoneNumberView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/28/22.
//

import SwiftUI


struct CustomPickerMenuView: View {
    let options: [String]
    @Binding var selectedOption: String
    var body: some View {
        ZStack {
            Menu {
                Picker("picker", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text("\(option)").tag(option)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(InlinePickerStyle())

                } label: {
                    HStack {
                        Rectangle()
                            .foregroundColor(Color.init(white: 1, opacity: 0.15))
                            .frame(height: 50)
                            .cornerRadius(10)
                        Image(systemName: "chevron.down")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                            .foregroundColor(.white)
                        
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.black, lineWidth: 1)
                        
                    )
                    .overlay(
                        Text("\(selectedOption)")
                            .padding(.leading, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)

                    )
                    .padding(5)
                    .cornerRadius(12)
                    .foregroundColor(.black)
                }
        }

    }
}
