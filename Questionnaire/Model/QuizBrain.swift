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
    
    func checkAnswer(_ userAnswer : String) -> String{
        if(userAnswer == quizQuestions[currentActiveQuestion].answer){
            //Correct
        }else{
            //Wrong
        }
        return userAnswer
    }
}
