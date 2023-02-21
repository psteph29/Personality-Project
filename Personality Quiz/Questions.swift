//
//  Questions.swift
//  Personality Quiz
//
//  Created by Paige Stephenson on 2/17/23.
//

import Foundation


// Question Struct

// Answer Struct

// define the types of questions

// define the types of answers

// define the actual answers



struct Questions {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}


enum ResponseType {
    case multiple, single, ranged
}

struct Answer {
    var text: String
    var type: barbieVillain
}


enum barbieVillain {
    case Rowena, Preminger, Arianna, Lydia
    
    var definition: String {
        switch self {
        case .Arianna :
            return "You must be incredibly mad at someone. You value revenge and are willing to ruin another person's chance at happiness to get what you want. You have lots of melatonin in your bathroom cabinet and you probably have weird pets."
        case .Preminger :
            return "You are patient, power hungry and care only about money. Guaranteed you're a narcissist. You can devise plans that will take years to execute. Love means nothing to you and you probably have ugly hair and a pimped out poodle."
        case .Rowena:
            return "You are a fun sucker. You hate dancing, color and laughter. Joy is not a word in your vocabulary. You pretend to care and be helpful in situations, but you use everything for personal gain. You're pretty toxic."
        case .Lydia:
            return "You are a straight up diva. You're probably musical, but you crave the spotlight and are difficult to work with. You want an entire castle to yourself and will most likely get into some weird voodoo to accomplish it. You probably live in a dark dump and should start taking vitamin D."
        }
    }
}



