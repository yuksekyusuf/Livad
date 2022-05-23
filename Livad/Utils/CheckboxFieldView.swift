//
//  CheckboxFieldView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/2/22.
//

import SwiftUI

struct CheckboxFieldView : View {
    @State var gender: String
    @State var states: [String:Bool] = [:]
    var body: some View {
        HStack{
            Image(systemName: states[gender]! ? "checkmark.circle.fill" : "circle")
                .foregroundColor(states[gender]! ? Color(UIColor.green) : Color.white)
            .onTapGesture {
                self.states.keys.forEach { states[$0] = false }
                self.states[gender]!.toggle()
            }
        Text("Male")
            .foregroundColor(.white)
        }
    }

}

struct CheckboxFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxFieldView(gender: "male")
    }
}
