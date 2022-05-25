//
//  IntroductionView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct IntroductionView: View {
    @State var pageSelection: Int = 1
    
    var body: some View {
        ZStack {
            Color.bottomDirtColor
                .ignoresSafeArea(.all, edges: .vertical)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            TabView(selection: $pageSelection) {
                IntroductionTemplateView(introductionText: "Mathematics is a universal language.", pageSelection: $pageSelection)
                    .tag(1)
                IntroductionTemplateView(introductionText: "With mathematics, people achieve great things!", pageSelection: $pageSelection)
                    .tag(2)
                IntroductionTemplateView(introductionText: "One of them is to help the development of structures in the world.", pageSelection: $pageSelection)
                    .tag(3)
                IntroductionTemplateView(introductionText: "Among these structures, they carry such an important values for a country.", pageSelection: $pageSelection)
                    .tag(4)
                IntroductionTemplateView(introductionText: "So, shall we build and explore the history and values of these structures in my Country, Indonesia?", pageSelection: $pageSelection)
                    .tag(5)
            }
            .transition(.slide)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }
    }
}

struct IntroductionTemplateView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var introductionText: String
    @Binding var pageSelection: Int
    
    var body: some View {
        VStack(spacing: 40) {
            Text(introductionText)
                .font(.title2)
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
            Button {
                if(pageSelection == 5) {
                    UserDefaults.standard.set(false, forKey: "showIntroduction")
                    presentationMode.wrappedValue.dismiss()
                } else {
                    withAnimation {
                        pageSelection += 1
                    }
                }
            } label: {
                HStack {
                    Text(pageSelection == 5 ? "Let's Build With Math" : "Next")
                }
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: UIScreen.main.bounds.width - 70, maxHeight: 77)
                .background(Color.optionBlockColor)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)
            }
        }
        .padding(.horizontal)
    }
}
