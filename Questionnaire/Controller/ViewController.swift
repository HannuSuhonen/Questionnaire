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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let quizAnswer = sender.titleLabel!.text! //True, false
        quizBrain.checkAnswer(userAnswer: quizAnswer)
        quizBrain.updatebuttonColor(button: sender)
        updateUI()
    }
    
    func updateUI(){
        questionText.text = quizBrain.getCurrentQuestionText()
        progressBar.progress = quizBrain.getQuizProgression()
    }
}
