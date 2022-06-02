//
//  CheckboxFieldView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/2/22.
//

import SwiftUI




struct CheckboxFieldView : View {
    @Binding var genderChecked: [String: Bool]
    let genderName: String
    var body: some View {
        Image(systemName: genderChecked[genderName]! ? "checkmark.circle.fill" : "circle")
            .foregroundColor(genderChecked[genderName]! ? Color(UIColor.green) : Color.white)
            .onTapGesture {
                self.genderChecked.keys.forEach { genderChecked[$0] = false }
                self.genderChecked[genderName]!.toggle()
//                viewModel.setting.gender = genderName
            }
        Text(genderName.capitalized)
            .foregroundColor(.white)
    }
    
    
//    @Binding var gender: Bool
//    @Binding var genderChecked: [String: Bool]
//    let placeHolder: String
//    var body: some View {
//        HStack{
//            Image(systemName: gender ? "checkmark.circle.fill" : "circle")
//                .foregroundColor(gender ? Color(UIColor.green) : Color.white)
//            .onTapGesture {
//                self.gender.toggle()
//                self.genderChecked.keys.forEach { genderChecked[$0] = false }
//            }
//        Text(placeHolder)
//            .foregroundColor(.white)
//        }
//    }

}
//
//struct CheckboxFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckboxFieldView(gender: $true, placeHolder: "male")
//    }
//}
