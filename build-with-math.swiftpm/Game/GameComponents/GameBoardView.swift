//
//  GameBoardView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct GameBoardView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var chosenValue: Int = 0
    @State var showDetailView: Bool = false
    
    @Binding var partCount: Int
    @Binding var totalHeart: Int
    @Binding var wrongAnswerState: Bool
    @Binding var showBoard: Bool
    
    var structureDetails: StructureInformation
    var levelQuestions = [[Int]]()
    
    func retryLevel() {
        withAnimation(.default) {
            partCount = 0
            totalHeart = 3
            showBoard = true
        }
    }
    
    func checkAnswer() {
        // [first, second, operator, answer, button]
        if(chosenValue == levelQuestions[partCount][3]) {
            partCount += 1
            playSound(sound: "buildSound", type: "mp3")
            
            if(partCount == 5) {
                showBoard = false
                
                UserDefaults.standard.set(
                    true,
                    forKey: "\(structureDetails.structureInitial)_status")
                playSound(sound: "levelFinished", type: "mp3")
            }
        } else {
            totalHeart -= 1
            playSound(sound: "wrongAnswer", type: "mp3")
            
            if(totalHeart == 0) {
                showBoard = false
                playSound(sound: "levelUnfinished", type: "mp3")
            } else {
                self.wrongAnswerState.toggle()
                
                Task {
                    try await Task.sleep(nanoseconds: 200_000_000)
                    
                    withAnimation {
                        self.wrongAnswerState.toggle()
                    }
                }
            }
        }
    }
    
    func checkOperator(index: Int) -> String {
        switch index {
        case 0:
            return "+"
        case 1:
            return "-"
        case 2:
            return "*"
        case 3:
            return "/"
        default:
            break;
        }
        return "???"
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.topDirtColor)
                    .frame(
                        width: UIScreen.main.bounds.size.width,
                        height: 40
                    )
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 10)
                Rectangle()
                    .fill(Color.bottomDirtColor)
                    .ignoresSafeArea(.all, edges: .bottom)
                    .frame(
                        width: UIScreen.main.bounds.size.width,
                        height: UIScreen.main.traitCollection.userInterfaceIdiom == .pad
                        ? 310
                        : UIScreen.main.bounds.size.height / 3
                    )
            }
            
            VStack(spacing: 40) {
                if(showBoard) {
                    Text("\(levelQuestions[partCount][0]) \(checkOperator(index: levelQuestions[partCount][2])) \(levelQuestions[partCount][1])")
                        .font(.system(size: 40, weight: .regular))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 85)
                        .background(Color.questionBlockColor)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.25), radius: 0, x: 0, y: 20)

                    HStack(spacing: 28) {
                        GameButtonView(
                            buttonValue:
                                levelQuestions[partCount][5] == 1
                                ? levelQuestions[partCount][3]
                                : levelQuestions[partCount][4],
                            buttonFunction: self.checkAnswer,
                            chosenValue: $chosenValue
                        )
                        
                        GameButtonView(
                            buttonValue:
                                // 0        1       2           3          4        5
                                // [first, second, operator, answer, secondguess, buttonindex]
                                levelQuestions[partCount][5] == 2
                                ? levelQuestions[partCount][3]
                                : levelQuestions[partCount][4],
                            buttonFunction: self.checkAnswer,
                            chosenValue: $chosenValue
                        )
                    }
                }
                else {
                    if(totalHeart == 0) {
                        VStack(spacing: 35) {
                            VStack(spacing: 15) {
                                Text("\(motivationNotes[Int.random(in: 0...motivationNotes.count - 1)])")
                                    .font(.title)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                Text("Try the level again")
                                    .font(.title3)
                                    .multilineTextAlignment(.center)
                            }
                            .foregroundColor(.white)
                            
                            HStack(spacing: 28) {
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    DetailButtonView(mainButton: false, buttonValue: "Return Home")
                                }
                                
                                Button {
                                    retryLevel()
                                } label: {
                                    DetailButtonView(mainButton: true, buttonValue: "Try Again")
                                }
                            }
                        }
                    } else {
                        VStack(spacing: 35) {
                            VStack(spacing: 10) {
                                Text("\(structureDetails.structureName)")
                                    .font(.title)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                Text("\(structureDetails.structureLocation)")
                                    .font(.title3)
                                    .multilineTextAlignment(.center)
                            }
                            .foregroundColor(.white)
                            
                            HStack(spacing: 28) {
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    DetailButtonView(mainButton: false, buttonValue: "Return Home")
                                }
                                
                                Button {
                                    showDetailView.toggle()
                                } label: {
                                    DetailButtonView(mainButton: true, buttonValue: "Learn More")
                                }
                                
                            }
                            .sheet(isPresented: $showDetailView) {
                                StructureDetailView(structureDetails: structureDetails)
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 40)
            .padding(.horizontal, 23)
        }
    }
}
