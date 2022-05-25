//
//  LevelGenerator.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import Foundation

struct LevelGenerator {
    static func setLevelInformation(levelType: Int) -> [[Int]] {
        var levelQuestions = [[Int]]()
        
        for _ in 1...5 {
            var firstInt = Int.random(in: 1..<20)
            var secondInt = Int.random(in: 1..<20)
            
            if (firstInt < secondInt) {
                (firstInt, secondInt) = (secondInt, firstInt)
            }
            
            let buttonIndex = Int.random(in: 1...2)
            
            var answer = 0;
            
            switch levelType {
            case 0:
                answer = firstInt + secondInt
                break;
            case 1:
                answer = firstInt - secondInt
                break;
            case 2:
                answer = firstInt * secondInt
                break;
            case 3:
                answer = firstInt / secondInt
                
                if(answer == 1) {
                    firstInt *= Int.random(in: 3...7)
                    answer = firstInt / secondInt
                }
                firstInt = answer * secondInt
                
                break;
            default:
                print("Error")
                break;
            }
            
            let secondGuess = generateSecondGuess(answer: answer)
      
            levelQuestions.append([firstInt, secondInt, levelType, answer, secondGuess, buttonIndex])
        }
        
        return levelQuestions
    }
    
    static func generateSecondGuess(answer: Int) -> Int{
        var secondGuess = answer + Int.random(in: -15...15)
        
        if(secondGuess == answer) {
            secondGuess += 1
        }
        
        return secondGuess
    }
}
