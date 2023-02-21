//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Paige Stephenson on 2/16/23.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var multipleLabel2: UILabel!
    @IBOutlet weak var multipleLabel3: UILabel!
    @IBOutlet weak var multipleLabel4: UILabel!
    
    @IBOutlet weak var multipleSwitch1: UISwitch!
    @IBOutlet weak var multipleSwitch2: UISwitch!
    @IBOutlet weak var multipleSwitch3: UISwitch!
    @IBOutlet weak var multipleSwitch4: UISwitch!

    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var questions: [Questions] = [
        Questions(text: "What do you like to do on a day off?",
                  type: .multiple,
                  answers: [
                    Answer(text: "Days off don't exist for you. Success waits for no one.", type: .Rowena),
                    Answer(text: "Get together with friends and expand your social circle", type: .Arianna),
                    Answer(text: "Spa day", type: .Preminger),
                    Answer(text: "Stay at home and take time for yourself", type: .Lydia)
                  ]
        ),
        Questions(text: "Karma or revenge?",
                  type: .ranged,
                  answers: [
                    Answer(text: "Karma", type: .Lydia),
                    Answer(text: "Mostly Karma", type: .Preminger),
                    Answer(text: "Mostly Revenge", type: .Rowena),
                    Answer(text: "Revenge", type: .Arianna)
                  ]
        ),
        Questions(text: "What is the best way to accomplish an evil scheme?",
                  type: .single,
                  answers: [
                    Answer(text: "Frame someone", type: .Arianna),
                    Answer(text: "Use magic", type: .Lydia),
                    Answer(text: "Blackmail", type: .Preminger),
                    Answer(text: "Treason", type: .Rowena)
                  ]
        ),
        Questions(text: "Which pet would you adopt?",
                  type: .single,
                  answers: [
                    Answer(text: "Dog", type: .Preminger),
                    Answer(text: "Monkey", type: .Rowena),
                    Answer(text: "Rodent", type: .Arianna),
                    Answer(text: "Dragon", type: .Lydia)
                  ]
        ),
        Questions(text: "What are your career goals?",
                  type: .multiple,
                  answers: [
                    Answer(text: "Become the CEO of an important company", type: .Rowena),
                    Answer(text: "Make a lot of money", type: .Preminger),
                    Answer(text: "Copy your friends goal and accomplish it before they do", type: .Arianna),
                    Answer(text: "Fame", type: .Lydia)
                  ]
        ),
        Questions(text: "Which of these best describe your personality?",
                  type: .multiple,
                  answers: [
                    Answer(text: "Arrogant", type: .Lydia),
                    Answer(text: "Mean", type: .Rowena),
                    Answer(text: "Manipulative", type: .Preminger),
                    Answer(text: "Cunning", type: .Arianna)
                  ]
        ),
        Questions(text: "Do you like wearing color?",
                  type: .ranged,
                  answers: [
                    Answer(text: "Not at all", type: .Rowena),
                    Answer(text: "Sometimes", type: .Lydia),
                    Answer(text: "Mostly", type: .Arianna),
                    Answer(text: "All the time", type: .Preminger)
                  ]
        ),
        Questions(text: "Favorite Holiday",
                  type: .single,
                  answers: [
                    Answer(text: "Christmas", type: .Lydia),
                    Answer(text: "All holidays suck", type: .Rowena),
                    Answer(text: "Love to hate Valentines Day", type: .Preminger),
                    Answer(text: "Mothers Day", type: .Arianna)
                  ]
        ),
        Questions(text: "Minimalist or Maximalist",
                  type: .ranged,
                  answers: [
                    Answer(text: "I prefer an empty house", type: .Lydia),
                    Answer(text: "I don't care much", type: .Rowena),
                    Answer(text: "I like my nice things", type: .Arianna),
                    Answer(text: "I will be boujee forever and always", type: .Preminger)
                  ]
        )
        
    ]
    
    var questionIndex = 0
    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multipleSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multipleSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multipleSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multipleSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }

    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
        
        func updateSingleStack(using answers: [Answer]) {
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Answer]) {
            multipleStackView.isHidden = false
            
            multipleSwitch1.isOn = false
            multipleSwitch2.isOn = false
            multipleSwitch3.isOn = false
            multipleSwitch4.isOn = false
            
            multipleLabel1.text = answers[0].text
            multipleLabel2.text = answers[1].text
            multipleLabel3.text = answers[2].text
            multipleLabel4.text = answers[3].text

            
        }
        
        func updateRangedStack(using answers: [Answer]) {
            rangedStackView.isHidden = false
            rangedSlider.setValue(0.4, animated: false)
            rangedLabel1.text = answers.first?.text
            rangedLabel2.text = answers.last?.text
        }
    }
   

}

