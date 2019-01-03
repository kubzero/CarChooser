//
//  QuestionViewController.swift
//  PersonalQuiz
//
//  Created by Andrew on 06/12/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet var questionaireView: UIView!
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var singleStackvIew: UIStackView!
    @IBOutlet var singleButton: [UIButton]!
    @IBOutlet var multiplyStackView: UIStackView!
    @IBOutlet var multipleLable: [UILabel]!
    @IBOutlet var rangedStackview: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    
    var questions: [Questions] = [
        Questions(text: "How much money you have?",type: .single, answer: [
            Answer(text: "A bit", type: .vw),
            Answer(text: "A lot", type: .bmw),
            Answer(text: "Millions", type: .porsche),
            Answer(text: "Billions", type: .lambo)
            ]),
        Questions(text: "Luxury or simple car?",type: .multiple, answer: [
            Answer(text: "Simple", type: .vw),
            Answer(text: "Not so important", type: .bmw),
            Answer(text: "Expensive", type: .porsche),
            Answer(text: "Luxury", type: .lambo),
            
            ]),
        Questions(text: "What fuel you prefore?",type: .ranged, answer: [
            Answer(text: "Disel", type: .vw),
            Answer(text: "Gas", type: .bmw),
            Answer(text: "Hybride", type: .porsche),
            Answer(text: "Bensine", type: .lambo),
            ]),
    ]
    
    var questionIndex = 0
    var answerChoosen: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
        setGradientBackground(colorTop: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), colorBottom: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = questionaireView.layer.bounds
        self.mainView.layer.addSublayer(gradientLayer)
    }
    
    
    func updateUi () {
        singleStackvIew.isHidden = true
        multiplyStackView.isHidden = true
        rangedStackview.isHidden = true
        
        navigationItem.title = "Question Nr \(questionIndex + 1)"
        let question = questions[questionIndex]
        let answers = question.answer
        questionLabel.text = question.text
        
        let progress =  Float(questionIndex)/Float(questions.count)
        progressView.progress = progress
        
        
        switch question.type {
        case .single:
            updateSingleStack(using: answers)
    
        case .multiple:
            updateMultiplyStack(using: answers)
           
        case .ranged:
            updateRangedStack(using: answers)
        }
    }
    func updateSingleStack(using answers: [Answer]) {
        singleStackvIew.isHidden = false
        singleButton.forEach{$0.isHidden = true}
        for index in 0..<min(singleButton.count, answers.count) {
            singleButton[index].isHidden = false
            singleButton[index].setTitle(answers[index].text, for: .normal)
        }
    
    }
    
    func updateMultiplyStack(using answers: [Answer]) {
        multiplyStackView.isHidden = false
        multipleLable.forEach{$0.superview!.isHidden = true}
        for index in 0..<min(multipleLable.count,answers.count) {
            multipleLable[index].superview!.isHidden = false
            multipleLable[index].text = answers[index].text
        }
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackview.isHidden = false
        rangedLabels.first!.text = answers.first!.text
        rangedLabels.last!.text = answers.first!.text
    }
    
    // MARK: - @IBACTION
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let answer = questions[questionIndex].answer
        let index = singleButton.index(of: sender)!
        answerChoosen.append(answer[index])
        nextQuestion()
        
    }
    
    @IBAction func multipleButtonPressed() {
        let answers = questions[questionIndex].answer
        for index in 0..<min(multipleLable.count, answers.count) {
            let lable = multipleLable[index]
            let stackview = lable.superview!
            let multiSwitch = stackview.subviews.last! as! UISwitch
            if multiSwitch.isOn {
                answerChoosen.append(answers[index])
            }
        }
        nextQuestion()
        
    }
    @IBAction func rangeButtonPressed() {
         let answers = questions[questionIndex].answer
      let index =   Int(round(slider.value * Float(answers.count - 1)))
        answerChoosen.append(answers[index])
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count{
            updateUi()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue"{
            let reultsViewController = segue.destination as! ReultsViewController
            reultsViewController.answer = answerChoosen
        }
    }
    
}
