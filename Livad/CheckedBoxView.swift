//
//  CheckedBoxView.swift
//  Livad
//
//  Created by Ahmet Yusuf Yuksek on 5/3/22.
//

import SwiftUI

struct Screen: View {
    
    
    @State var isOn1: Bool = false
    @State var isOn2: Bool = false
    var body: some View {
        VStack(alignment:.leading, spacing:20) {
            Text("My Check Box List")
                .font(.system(size: 16))
                .bold()
                .foregroundColor(.black)
            Toggle("Checkbox 1", isOn: $isOn1)
              .toggleStyle(CheckboxToggle(style: .square))
              .foregroundColor(.blue)
            
            Toggle("Checkbox 2", isOn: $isOn2)
              .toggleStyle(CheckboxToggle(style: .circle))
              .foregroundColor(.red)
            
        }.padding(20)
    }
    
}



struct CheckedBoxView_Previews: PreviewProvider {
    static var previews: some View {
        Screen()
    }
}

struct CheckboxToggle: ToggleStyle {
  @Environment(\.isEnabled) var isEnabled
  let style: Style // custom param

  func makeBody(configuration: Configuration) -> some View {
    Button(action: {
      configuration.isOn.toggle() // toggle the state binding
    }, label: {
      HStack {
        Image(systemName: configuration.isOn ? "checkmark.\(style.sfSymbolName).fill" : style.sfSymbolName)
          .imageScale(.large)
        configuration.label
      }
    })
    .buttonStyle(PlainButtonStyle()) // remove any implicit styling from the button
    .disabled(!isEnabled)
  }

  enum Style {
    case square, circle

    var sfSymbolName: String {
      switch self {
      case .square:
        return "square"
      case .circle:
        return "circle"
      }
    }
  }
}
