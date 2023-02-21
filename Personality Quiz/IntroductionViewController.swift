//
//  ViewController.swift
//  Personality Quiz
//
//  Created by Paige Stephenson on 2/16/23.
//

import UIKit

class IntroductionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
    }

}

// Tasks to accomplish:
//write code for questions
//Show only one question at a time and have the navigation bar show what question you are on
// update labels and buttons text
// Associate answers with text
// Record the players answers and move to the next question. When the player has answered every question in the collection, you will then present the results screen.
// for single stack view: you will determine which outcome each tapped button corresponds to, append it to the collection, then move on to the next question. All buttons will perform the same work, so create a single action that any of the four buttons will call when tapped.
// for multiple-answer user interface, you determine which answers to add to the collection based on the switches the player has enabled. The argument action should be changed to none since you don't need the button to determine which answers were chosen.
//For ranged response, you will read the current position of the UISlider and use that value to determine which answer to add to the collection. Change the arguments attribute to none.
//Passing data to the results view: add a property to hold the user's responses.
//Respond to answered questions: do this in a func called nextQuestion. to move to next question, increment the index by 1. To display results, use the segue created in the storyboard.
// reset positions of the switches and slider to logical defaults when the next question is displayed
//Calculate and display results : Loop thorugh each answer structures in the responses property and calculate which type was most common in the collection
//Update the labels on the results page
//Restart the quiz
