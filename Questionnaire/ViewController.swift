//
//  ViewController.swift
//  Questionnaire
//
//  Created by Hannu Suhonen on 22.2.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    
    @IBOutlet weak var falseButton: UIButton!
    var defaultButtonColor = UIColor.white
    
    let quizQuestions = [
        Question(q: "2 + 1 = 3",a: "True"),
        Question(q: "1 + 1 = 2?",a: "True"),
        Question(q: "5 + 8 = 13?",a: "True"),
        Question(q: "8 * 7 = 56?",a: "True")
    ]
    var currentActiveQuestion = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if(currentActiveQuestion >= quizQuestions.count){
            currentActiveQuestion = 0
            score = 0
            updateUI()
            return
        }
        print(currentActiveQuestion)
        
        let quizAnswer = sender.titleLabel?.text //True, false
        let chosenAnswer = quizQuestions[currentActiveQuestion].answer
        
        if(chosenAnswer == quizAnswer){
            score += 1
        }
        currentActiveQuestion += 1
        updateUI()
        updatebuttonColor(button: sender, chosenAnswer: chosenAnswer, quizAnswer: quizAnswer!)
    }
    func updatebuttonColor( button: UIButton, chosenAnswer: String, quizAnswer: String){
        if(chosenAnswer == quizAnswer){
            button.backgroundColor = UIColor.green
        }else{
            button.backgroundColor = UIColor.red
        }
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                button.backgroundColor = .clear
        }
    }
    func updateUI(){
        if(currentActiveQuestion > 3){
            let scoreIndecimal = Float(score)/Float(quizQuestions.count)
            let scoreInPercent = scoreIndecimal * 100
                                             
            questionText.text = "Congratz! Your score is \(scoreInPercent) %"
        }else{
            questionText.text = quizQuestions[currentActiveQuestion].text
        }
        progressBar.progress = Float(currentActiveQuestion)/Float(quizQuestions.count)
    }
}

