////
////  CheckboxFieldView.swift
////  Livad
////
////  Created by Ahmet Yusuf Yuksek on 5/2/22.
////
//
//import SwiftUI
//
//
//
//
//struct CheckboxFieldView : View {
//    @Binding var genderChecked: [String: Bool]
//    let genderName: String
//    var body: some View {
//        Image(systemName: genderChecked[genderName]! ? "checkmark.circle.fill" : "circle")
//            .foregroundColor(genderChecked[genderName]! ? Color(UIColor.green) : Color.white)
//            .onTapGesture {
//                self.genderChecked.keys.forEach { genderChecked[$0] = false }
//                self.genderChecked[genderName]!.toggle()
//            }
//        Text(genderName.capitalized)
//            .foregroundColor(.white)
//            .onTapGesture {
//                self.genderChecked.keys.forEach { genderChecked[$0] = false }
//                self.genderChecked[genderName]!.toggle()
//            }
//    }
//}
