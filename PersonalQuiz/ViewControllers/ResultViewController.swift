//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var titleResultLabel: UILabel!
    @IBOutlet var descriptionResultLabel: UILabel!
    
    var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        showResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func showResult() {
        var animals: [Animal] = []
        
        answersChoosen.forEach { answer in
            animals.append(answer.animal)
        }
        
        var animalCount: [Animal: Int] = [:]
        animals.forEach { animalCount[$0] = (animalCount[$0] ?? 0) + 1 }
        
        if let (animal, _) = animalCount.max(by: { $0.1 < $1.1 }) {
            titleResultLabel.text = "Вы - \(animal.rawValue)"
            descriptionResultLabel.text = "\(animal.definition)"
        }
    }
}
