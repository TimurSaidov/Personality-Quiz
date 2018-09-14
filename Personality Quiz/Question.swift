//
//  Question.swift
//  Personality Quiz
//
//  Created by Timur Saidov on 14.09.2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import Foundation

struct Question {
    var text: String // Текст вопроса.
    var type: ResponseType // Тип вопроса.
    var answer: [Answer] // Список ответов.
}

enum ResponseType {
    case single, multiple, ranged // Тип вопроса: один правильный ответ, несколько правильных ответов и когда ответ - промежуток.
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", frog = "🐸"
    
    var definition: String {
        switch self {
        case .dog:
            return "You surround yourself with people you like, and enjoy spending time with friends."
        case .cat:
            return "You like to do everything yourself."
        case .rabbit:
            return "You like soft. You are full of energy."
        case .frog:
            return "You are full of energy and enjoy water."
        }
    }
}
