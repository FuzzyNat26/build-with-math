//
//  StructureView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct StructureView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var partCount: Int = 0
    @State var totalHeart: Int = 3
    
    @State var levelQuestions: [[Int]]
    
    @State var showBoard: Bool = true
    @State var showPause: Bool = false
    @State var wrongAnswerState: Bool = false
    
    var levelType: Int
    var structureDetails: StructureInformation
    var skyColor: Color
    
    init(levelType: Int, structureDetails: StructureInformation) {
        self.levelType = levelType
        self._levelQuestions = State(initialValue: LevelGenerator.setLevelInformation(levelType: levelType))
        self.structureDetails = structureDetails
        
        self.skyColor = structureDetails.structureSky
    }
    
    func togglePause() {
        withAnimation {
            showPause.toggle()
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [
                skyColor,
                .white
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(.all)
            VStack {
                HStack {
                    ZStack {
                        Text("Part \(partCount)/5")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(color: .gray.opacity(0.6), radius: 2, x: 0, y: 3)
                        
                        HStack {
                            HeartView(totalHeart: $totalHeart)
                            Spacer()
                            if(showBoard) {
                                Button {
                                    togglePause()
                                } label: {
                                    Image(systemName: "pause.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.white)
                                        .shadow(color: .gray.opacity(0.6), radius: 2, x: 0, y: 3)
                                }
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
                
                VStack(spacing: 0) {
                    StructureComponentView(partCount: $partCount, structureName: structureDetails.structureInitial)
                    
                    GameBoardView(
                        partCount: $partCount,
                        totalHeart: $totalHeart,
                        wrongAnswerState: $wrongAnswerState,
                        showBoard: $showBoard,
                        structureDetails: structureDetails,
                        levelQuestions: levelQuestions
                    )
                }
                
                
            }
            
            Rectangle()
                .strokeBorder(
                    .red
                        .opacity(wrongAnswerState ? 0.8 : 0),
                    lineWidth: 15
                )
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
                .ignoresSafeArea(.all, edges: .all)
                .animation(.easeInOut, value: wrongAnswerState)
                .transition(.opacity)
            
            if (showPause) {
                ZStack {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea(.all, edges: .all)
                    VStack {
                        Text("Paused")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                        VStack(spacing: 30) {
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label:
                            {
                                HStack {
                                    Text("Return To Home")
                                }
                                .font(.system(size: 30, weight: .regular))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 85)
                                .background(Color.optionBlockColor)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)
                            }
                            Button {
                                togglePause()
                            } label: {
                                HStack {
                                    Text("Cancel")
                                }
                                .font(.system(size: 30, weight: .regular))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 85)
                                .background(Color.questionBlockColor)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)
                            }
                        }
                        
                    }
                    .padding(50)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
