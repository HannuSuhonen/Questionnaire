//
//  QuizBrain.swift
//  Questionnaire
//
//  Created by Hannu Suhonen on 14.3.2023.
//

import Foundation

struct QuizBrain{
    let quizQuestions = [
        Question(q: "2 + 1 = 3",a: "True"),
        Question(q: "1 + 1 = 2?",a: "True"),
        Question(q: "5 + 8 = 13?",a: "True"),
        Question(q: "8 * 7 = 56?",a: "True")
    ]
    var currentActiveQuestion = 0
    
    func checkAnswer(userAnswer : String) -> Bool{
        if(userAnswer == quizQuestions[currentActiveQuestion].answer){
            return true
        }else{
            return false
        }
    }
    func getQuizProgression() -> Float{
        return Float(currentActiveQuestion)/Float(quizQuestions.count)
    }
    func getCurrentQuestionText(_ score:Int) -> String{
        if(currentActiveQuestion > 3){
            let scoreIndecimal = Float(score)/Float(quizQuestions.count)
            let scoreInPercent = scoreIndecimal * 100
            
            return "Congratz! Your score is \(scoreInPercent) %"
        }else{
            return quizQuestions[currentActiveQuestion].text
        }
    }
}
