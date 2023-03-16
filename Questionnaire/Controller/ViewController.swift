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
    
    var quizBrain = QuizBrain()


    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if(quizBrain.currentActiveQuestion >= quizBrain.quizQuestions.count){
            quizBrain.currentActiveQuestion = 0
            score = 0
            updateUI()
            return
        }
        
        let quizAnswer = sender.titleLabel!.text! //True, false
        let ifUserGotItRight = quizBrain.checkAnswer(userAnswer: quizAnswer)
        //let chosenAnswer = quizQuestions[currentActiveQuestion].answer
        
        if(ifUserGotItRight){
            score += 1
        }
        quizBrain.currentActiveQuestion += 1
        updateUI()
        updatebuttonColor(button: sender, ifUserGotItRight: ifUserGotItRight)
    }
    func updatebuttonColor( button: UIButton, ifUserGotItRight: Bool){
        if(ifUserGotItRight){
            button.backgroundColor = UIColor.green
        }else{
            button.backgroundColor = UIColor.red
        }
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                button.backgroundColor = .clear
        }
    }
    func updateUI(){
        questionText.text = quizBrain.getCurrentQuestionText(score)
        progressBar.progress = quizBrain.getQuizProgression()
    }
}

