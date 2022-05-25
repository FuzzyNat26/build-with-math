//
//  ButtonView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct GameButtonView: View {
    var buttonValue: Int
    var buttonFunction: () -> Void
    @Binding var chosenValue: Int
    
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.4)) {
                chosenValue = buttonValue
                buttonFunction()
            }
        } label: {
            HStack {
                Text("\(buttonValue)")
            }
            .font(.system(size: 40, weight: .regular))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 85)
            .background(Color.optionBlockColor)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)
        }
    }
}

struct DetailButtonView: View {
    @State var mainButton: Bool = false
    var buttonValue: String
    
    var body: some View {
        HStack {
            Text("\(buttonValue)")
        }
        .padding(.horizontal, 5)
        .multilineTextAlignment(.center)
        .font(.system(size: 24, weight: .regular))
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: 85)
        .background(mainButton ? Color.optionBlockColor : Color.questionBlockColor)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)
    }
}
