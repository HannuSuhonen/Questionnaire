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
        
        currentActiveQuestion += 1
        updateUI()
        
        if(currentActiveQuestion > 3){return}
        
        print(quizQuestions[currentActiveQuestion][1])
        
        if(sender.titleLabel?.text == quizQuestions[currentActiveQuestion][1]){
            score += 1
        }else{
            score -= 1
        }
       
        print(score)
        
    }
    func updateUI(){
        if(currentActiveQuestion > 3){
            questionText.text = "Congratz!"
        }else{
            questionText.text = quizQuestions[currentActiveQuestion][0]
        }
        
        progressBar.progress = Float(currentActiveQuestion)/Float(quizQuestions.count)
    }
}

