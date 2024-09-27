//
//  ViewController.swift
//  Quizzler
//
//  Created by salfetkafive on 27.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
   
    private var views = View()
    private var quizBrain = QuizBrain()
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        views.frame = UIScreen.main.bounds
        view.addSubview(views)
        views.choiceOne.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        views.choiceTwo.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        views.choiceThree.addTarget(self, action: #selector(answerButtonTapped(_:)), for: .touchUpInside)
        updateUI()
    }
    
    
    
    // MARK: - Button Actions
    @objc private func answerButtonTapped(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // true false button
        let userGotItRight = quizBrain.checkAnswer(of: userAnswer)
        
        
        
        if userGotItRight {
            print("You are right!")
            
            
//            if sender.currentTitle == "False" {
//                sender.backgroundColor = UIColor.green
//                trueButtom.backgroundColor = UIColor.clear
//            } else if sender.currentTitle == "True" {
//                sender.backgroundColor = UIColor.green
//                falseButton.backgroundColor = UIColor.clear
//            }
            
                
            
            sender.backgroundColor = UIColor.green
            
        } else {
            print("You Made A Mistake!")
//            if sender.currentTitle == "False" {
//                sender.backgroundColor = UIColor.red
//                trueButtom.backgroundColor = UIColor.clear
//            } else if sender.currentTitle == "True" {
//                sender.backgroundColor = UIColor.red
//                falseButton.backgroundColor = UIColor.clear
//            }
            
           
            sender.backgroundColor = UIColor.red
            
        }
        
        //print(questionNumber, quiz.count)
        
        
        quizBrain.nextQuestion()
        //var timer = Timer()
        //timer =
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
       
        //updateUI()
        //let percentage: Float = Float(questionNumber + 1) / Float(quiz.count)
                    
        //progress = percentage
        
        
    }
    
    @objc private func updateUI() {
        views.questionLabel.text = quizBrain.getQuestionText()
        views.scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        views.choiceOne.setTitle(quizBrain.getAnswer(num: 0), for: .normal)
        views.choiceTwo.setTitle(quizBrain.getAnswer(num: 1), for: .normal)
        views.choiceThree.setTitle(quizBrain.getAnswer(num: 2), for: .normal)
        
        
        views.choiceOne.backgroundColor = UIColor.clear
        views.choiceTwo.backgroundColor = UIColor.clear
        views.choiceThree.backgroundColor = UIColor.clear
        
        let percentage: Float = quizBrain.getProgress()
                    
        views.progressBar.progress = percentage
        
    }
}

