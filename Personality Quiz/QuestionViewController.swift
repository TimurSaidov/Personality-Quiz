//
//  QuestionViewController.swift
//  Personality Quiz
//
//  Created by Timur Saidov on 13.09.2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
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
    @IBOutlet weak var multipleLable1: UILabel!
    @IBOutlet weak var multipleLable2: UILabel!
    @IBOutlet weak var multipleLable3: UILabel!
    @IBOutlet weak var multipleLable4: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var questions: [Question] = [
        Question(text: "What kind of food do you like?", type: .single, answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrot", type: .rabbit),
            Answer(text: "Insect", type: .frog)
            ]),
        Question(text: "What do you like to do?", type: .multiple, answers: [
            Answer(text: "To run", type: .dog),
            Answer(text: "To sleep", type: .cat),
            Answer(text: "To jump", type: .rabbit),
            Answer(text: "To swim", type: .frog)
            ]),
        Question(text: "How much do you like car rides?", type: .ranged, answers: [
            Answer(text: "Hate it", type: .cat),
            Answer(text: "A little bit nervous", type: .rabbit),
            Answer(text: "Hardly notice", type: .frog),
            Answer(text: "Enjoy it", type: .dog)
            ])
    ]
    
    var questionIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question №\(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex]
        
        switch currentQuestion.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multipleStackView.isHidden = false
        case .ranged:
            rangedStackView.isHidden = false
        }
    }
}
