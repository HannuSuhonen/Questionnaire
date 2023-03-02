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
    
    let quizQuestions = [
                         ["2 + 1 = 3?","True"],
                         ["1 + 1 = 2?","True"],
                         ["5 + 8 = 13?","True"],
                         ["8 * 7 = 56?","True"]]
    var currentActiveQuestion = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if(currentActiveQuestion >= quizQuestions.count){ return }
        
        let quizAnswer = sender.titleLabel?.text //True, false
        let chosenAnswer = quizQuestions[currentActiveQuestion][1]
        
        if(chosenAnswer == quizAnswer){
            score += 1
        }
        print(score)
        
        currentActiveQuestion += 1
        updateUI()
        
    }
    func updateUI(){
        if(currentActiveQuestion > 3){
            let scoreIndecimal = Float(score)/Float(quizQuestions.count)
            let scoreInPercent = scoreIndecimal * 100
                                             
            questionText.text = "Congratz! Your score is \(scoreInPercent) %"
        }else{
            questionText.text = quizQuestions[currentActiveQuestion][0]
        }
        
        progressBar.progress = Float(currentActiveQuestion)/Float(quizQuestions.count)
    }
}

