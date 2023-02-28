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
    
    let quizQuestions = ["Begin Questionnaire?",
                         "1 + 1 = 2?",
                         "5 + 8 = 13?",
                         "8 * 7 = 56?"]
    var currentActiveQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        currentActiveQuestion += 1
        updateUI()
    }
    func updateUI(){
        progressBar.progress = Float(currentActiveQuestion)/Float(quizQuestions.count)
        
        if(currentActiveQuestion > 3){
            questionText.text = "Congratz!"
        }else{
            questionText.text = quizQuestions[currentActiveQuestion]
        }
    }
}

