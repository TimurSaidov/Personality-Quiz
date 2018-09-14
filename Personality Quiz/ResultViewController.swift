//
//  ResultViewController.swift
//  Personality Quiz
//
//  Created by Timur Saidov on 13.09.2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]! // Массив ответов на вопросы [{text: "Fish", type: .cat}, {...}, {...}].
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        
        let responseTypes = responses.map { $0.type } // В массив responseTypes записывается св-во type каждого элемента массива responses типа Answer [AnimalType.cat AnimalType.dog .cat].
        print(responseTypes)
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1 // Если ключа response  нет (нет ключа .dog, .cat, .rabbit, .frog), то значение этого ключа ставится равным 0 + 1, а если ключ уже есть, то есть словарь заполнен, то frequencyOfAnswers[response] + 1.
        }
        
//        let frequentAnswersSorted = frequencyOfAnswers.sorted { (pair1, pair2) -> Bool in
//            return pair1.value > pair2.value
//        }
//
//        let mostCommontAnswer = frequentAnswersSorted.first!.key
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key // Сортировка словаря frequencyOfAnswers и запись первого элемента отсортированного словаря в константу let mostCommonAnswer: AnimalType.
        
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}

