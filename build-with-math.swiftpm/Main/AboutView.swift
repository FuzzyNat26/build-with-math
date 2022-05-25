//
//  AboutView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 35) {
                    VStack(alignment: .leading) {
                        Text("Welcome To")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("Build With Math")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.skyColor[0])
                    }
                    Text("My name is Jonathan from Indonesia, a computer science college student from International University of Batam and a Learner at Apple Developer Academy @ Infinite Learning Batam.")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                    Text("This project was created to show the power of mathematics in creating structures in Indonesia! ")
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                }
                .padding(.top)
                
                Spacer()
            }
            .padding(25)
           
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(maxWidth: 35, maxHeight: 35)
                    .foregroundColor(.gray)
            }
            .padding(20)
            .ignoresSafeArea(.all, edges: .top)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
