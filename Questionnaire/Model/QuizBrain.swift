//
//  QuizBrain.swift
//  Questionnaire
//
//  Created by Hannu Suhonen on 14.3.2023.
//

import Foundation
import UIKit

struct QuizBrain{
    let quizQuestions = [
        Question(q: "2 + 4 = 8",a: "False"),
        Question(q: "2 + 9 = 12?",a: "False"),
        Question(q: "5 + 8 = 13?",a: "True"),
        Question(q: "8 * 7 = 56?",a: "True")
    ]
    var currentActiveQuestion = 0
    var score = 0
    var userGotItRight = false
    var quizEnded = false
    
    mutating func checkAnswer(userAnswer : String){
        
        if(currentActiveQuestion >= quizQuestions.count){
            currentActiveQuestion = 0
            score = 0
            quizEnded = true
            return
        }
        else
        {
            quizEnded = false
        }
        
        if(userAnswer == quizQuestions[currentActiveQuestion].answer){
            score += 1
            currentActiveQuestion += 1
            userGotItRight = true
        }else{
            currentActiveQuestion += 1
            userGotItRight = false
        }
    }
    func getQuizProgression() -> Float{
        return Float(currentActiveQuestion)/Float(quizQuestions.count)
    }
    func getCurrentQuestionText() -> String{
        if(currentActiveQuestion > 3){
            let scoreIndecimal = Float(score)/Float(quizQuestions.count)
            let scoreInPercent = scoreIndecimal * 100
            
            return "Congratz! Your score is \(scoreInPercent) %"
        }else{
            return quizQuestions[currentActiveQuestion].text
        }
    }
    mutating func updatebuttonColor( button: UIButton){
        if(quizEnded){
            return
        }
        if(userGotItRight){
            button.backgroundColor = UIColor.green
        }else{
            button.backgroundColor = UIColor.red
        }
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                button.backgroundColor = .clear
        }
    }
}
