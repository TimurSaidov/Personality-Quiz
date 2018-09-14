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
    @IBOutlet weak var multipleSwitch1: UISwitch!
    @IBOutlet weak var multipleSwitch2: UISwitch!
    @IBOutlet weak var multipleSwitch3: UISwitch!
    @IBOutlet weak var multipleSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            chosenAnswers.append(currentAnswers[0])
        case singleButton2:
            chosenAnswers.append(currentAnswers[1])
        case singleButton3:
            chosenAnswers.append(currentAnswers[2])
        case singleButton4:
            chosenAnswers.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        if multipleSwitch1.isOn {
            chosenAnswers.append(currentAnswers[0])
        }
        if multipleSwitch2.isOn {
            chosenAnswers.append(currentAnswers[1])
        }
        if multipleSwitch3.isOn {
            chosenAnswers.append(currentAnswers[2])
        }
        if multipleSwitch4.isOn {
            chosenAnswers.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        let indexOfAnswerInSlider = Int(round(rangedSlider.value * Float(currentAnswers.count - 1))) // currentAnswer.count - 1 потому, что кол-во элементов 4, а индекс элементов 0,1,2,3. То есть если слайдер [0...0.25] -> 0.25 * 3 = 0.75 -> элемент 0. Если слайдер [0.25...0.50] -> 0.5 * 3 = 1.5 -> элемент 1. Если слайдер [0.50...0.75] -> 0.75 * 3 = 2.25 -> элемент 2. Если слайдер [0.75...1] -> 1 * 3 = 3 -> элемент 3
        print(indexOfAnswerInSlider)
        chosenAnswers.append(currentAnswers[indexOfAnswerInSlider])
    
        nextQuestion()
    }
    
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
    
    var chosenAnswers: [Answer] = [] // Массив для выбранных(ого) ответов(ответа) на текущий вопрос.

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // Функция для отображения Stack View, соотвествующего текущему вопросу.
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question №\(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex] // Текущий вопрос.
        let currentAnswers = currentQuestion.answers // Массив ответов на текущий вопрос.
        let totalProgress = Float(questionIndex + 1) / Float(questions.count) // Прогресс на текущий момент.
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
        
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: UIControlState.normal)
        singleButton2.setTitle(answers[1].text, for: UIControlState.normal)
        singleButton3.setTitle(answers[2].text, for: UIControlState.normal)
        singleButton4.setTitle(answers[3].text, for: UIControlState.normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multipleSwitch1.isOn = false
        multipleSwitch2.isOn = false
        multipleSwitch3.isOn = false
        multipleSwitch4.isOn = false
        multipleLable1.text = answers[0].text
        multipleLable2.text = answers[1].text
        multipleLable3.text = answers[2].text
        multipleLable4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: true)
        rangedLabel1.text = answers.first?.text // Первый элемент массива.
        rangedLabel2.text = answers.last?.text // Последний элемент массива.
    }
    
    // Функция для перехода на следующий вопрос.
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultsSegue" {
            guard let resultViewController = segue.destination as? ResultViewController else { return }
            resultViewController.responses = chosenAnswers // Массив ответов на все вопросы.
            questionIndex = 0
            chosenAnswers = []
            updateUI()
        }
    }
}
