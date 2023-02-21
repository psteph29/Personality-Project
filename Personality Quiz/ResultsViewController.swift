//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Paige Stephenson on 2/16/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    @IBOutlet weak var villainImageResult: UIImageView!
 
                        
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()

        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
    
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are \(mostCommonAnswer)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        if mostCommonAnswer == .Rowena {
            villainImageResult.image = UIImage(named:
            "Rowena")
        } else if mostCommonAnswer == .Lydia {
            villainImageResult.image = UIImage(named: "Lydia")
        } else if mostCommonAnswer == .Preminger {
            villainImageResult.image = UIImage(named: "Preminger")
        } else if mostCommonAnswer == .Arianna {
            villainImageResult.image = UIImage(named: "Arianna")
        }

        
    }
    
}
