//
//  TutorialView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct TutorialView: View {
    @State var pageSelection: Int = 1
    
    var body: some View {
        ZStack {
            Color.bottomDirtColor
                .ignoresSafeArea(.all, edges: .vertical)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            TabView(selection: $pageSelection) {
                TutorialTemplateView(tutorialText: "There are 4 kinds of math levels to choose from.", tutorialPages: 1, pageSelection: $pageSelection)
                    .tag(1)
                TutorialTemplateView(tutorialText: "Structure will be build after a question is answer correctly. \n\nYou have 3 chances!", tutorialPages: 2, pageSelection: $pageSelection)
                    .tag(2)
                TutorialTemplateView(tutorialText: "The full structure will be shown after completion. \n\nThe drawing does not fully represent the real structure.", tutorialPages: 3, pageSelection: $pageSelection)
                    .tag(3)
                TutorialTemplateView(tutorialText: "After the level were completed, you can learn more about the structures by pressing the information icon!", tutorialPages: 4, pageSelection: $pageSelection)
                    .tag(4)
                TutorialTemplateView(tutorialText: "The detail screen includes name, location, and brief information of the structure.", tutorialPages: 5, pageSelection: $pageSelection)
                    .tag(5)
            }
            .transition(.slide)
            .tabViewStyle(.page)
            .padding(.bottom, 30)
            .ignoresSafeArea(.all, edges: .vertical)
        }
    }
}

struct TutorialTemplateView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var tutorialText: String
    var tutorialPages: Int
    @Binding var pageSelection: Int
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Color.skyColor[0]
                Image("tutorial-\(tutorialPages)")
                    .resizable()
                    .scaledToFit()
            }
            .ignoresSafeArea(.all, edges: .all)
            
            VStack() {
                Text(tutorialText)
                    .bold()
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Button {
                    if(pageSelection == 5) {
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        withAnimation {
                            pageSelection += 1
                        }
                    }
                } label: {
                    HStack {
                        Text(pageSelection == 5 ? "Back to Home" : "Next")
                    }
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 77)
                    .background(Color.optionBlockColor)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)
                }
            }
            .padding(30)
            .padding(.bottom, 30)
            .frame(maxHeight: UIScreen.main.bounds.height / 2.8)
        }
    }
}
