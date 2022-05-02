//
//  CheckboxFieldView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/2/22.
//

import SwiftUI

struct CheckboxFieldView : View {

    @State var checkState:Bool = false
    var body: some View {
        Image(systemName: checkState ? "checkmark.square.fill" : "square")
            .foregroundColor(checkState ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checkState.toggle()
            }
    }

}

struct CheckboxFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxFieldView()
    }
}
