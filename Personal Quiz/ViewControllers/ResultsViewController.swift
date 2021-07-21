//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var navigationProperty: UINavigationItem!
    
    // MARK: - Public properties
    
    // Передаем массив с ответами
    var answers: [Answer]! = []
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    // MARK: - Override methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Скрываем кнопку "Back"
        navigationItem.hidesBackButton = true
        
        // Определяем наиболее часто встерчающийся тип живтоного
        let answer = sorting()
        
        //Отображаем результат в соответсвии с этим животным
        descriptionLabel.text = answer.type.definition
        emojiLabel.text = "Вы - \(answer.type.rawValue)"
    }
    
    // MARK: - Private methods
    
    private func sorting() -> Answer {
        let sortedSet = NSCountedSet(array: answers)
        let mostFrequent = sortedSet.max {
            sortedSet.count(for: $0) < sortedSet.count(for: $1)
        }
        let answer = mostFrequent as! Answer
        return answer
    }

    
    
}
