//
//  MainView.swift
//  
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct MainView: View {
    @State var showAboutView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bottomDirtColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 60) {
                    VStack {
                        Text("Build")
                            .font(.system(size: 52, weight: .heavy))
                            .bold()
                            .foregroundColor(.white)
                        Text("With")
                            .font(.system(size: 52, weight: .heavy))
                            .bold()
                            .foregroundColor(.white)
                        Text("Math")
                            .font(.system(size: 52, weight: .heavy))
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    VStack(spacing: 40) {
                        NavigationLink {
                            GameLevelView()
                        } label: {
                            HStack {
                                Text("Play Game")
                            }
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 85)
                            .background(Color.optionBlockColor)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)
                        }
                        NavigationLink {
                            TutorialView()
                        } label: {
                            HStack {
                                Text("How To Play")
                            }
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 85)
                            .background(Color.questionBlockColor
                            )
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)
                        }
                        Button {
                            showAboutView.toggle()
                        } label: {
                            Text("About Me")
                                .font(.system(size: 24, weight: .semibold))
                                .font(.headline)
                                .foregroundColor(.white)
                        }

                    }
                    
                    .padding()
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showAboutView) {
                AboutView()
            }
        }
        .navigationViewStyle(.stack)
    }
}
