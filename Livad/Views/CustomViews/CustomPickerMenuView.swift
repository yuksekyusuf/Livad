//
//  PhoneNumberView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 6/28/22.
//

import SwiftUI


struct CustomPickerMenuView: View {
    var options: [String]
    @State var selectedOption: String
    var body: some View {
        Menu {
                Picker("picker", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text("\(option)")
                    }
                }
                .labelsHidden()
                .pickerStyle(InlinePickerStyle())

            } label: {

                HStack {
                    Rectangle()
                        .foregroundColor(Color(.systemBackground))
                        .frame(height: 40)
                    Image(systemName: "chevron.down")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
                .overlay(
                    Text("\(selectedOption)")
                )
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
    }
}
