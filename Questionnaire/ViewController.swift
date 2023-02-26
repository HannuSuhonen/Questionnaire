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
                         "Test 1 question?",
                         "Test 2 question",
                         "Test 3 question"]
    var currentActiveQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizQuestions[0]
        currentActiveQuestion += 1
        progressBar.progress = 0.25
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print(currentActiveQuestion)
        switch currentActiveQuestion {
        case 0:
            questionText.text = quizQuestions[0]
        case 1:
            questionText.text = quizQuestions[1]
            progressBar.progress = 1/3
        case 2:
            questionText.text = quizQuestions[2]
            progressBar.progress = 2/3
        case 3:
            questionText.text = quizQuestions[3]
            progressBar.progress = 3/3
        default:
            //Reset Questionnaire
            currentActiveQuestion = 0
            return
        }
        currentActiveQuestion += 1
    }
}

