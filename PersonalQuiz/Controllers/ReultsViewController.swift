//
//  ReultsViewController.swift
//  PersonalQuiz
//
//  Created by Andrew on 06/12/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class ReultsViewController: UIViewController {
    @IBOutlet var resultingAnimale: UILabel!
    @IBOutlet var descriptionAnimal: UILabel!
    @IBOutlet var carImage: UIImageView!
    
    var answer:[Answer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
          navigationItem.setHidesBackButton(true, animated: false)
        print(#function , answer!)
        logic()
    }

    func logic() {
        var cat = 0
        var dog = 0
        var rabbit = 0
        var turtle = 0
        
         var counts: [AnimalType: Int] = [:]

        for each in answer! {
            switch each.type {
            case AnimalType.vw:
                if let some = counts[.vw], some != nil {
                    counts.updateValue(some + 1, forKey: .vw)
                } else {
                    counts.updateValue(1, forKey: .vw)
                }
                cat += 1
            case AnimalType.bmw:
                if var some = counts[.bmw], some != nil {
                    counts.updateValue(some + 1, forKey: .bmw)
                } else {
                    counts.updateValue(1, forKey: .bmw)
                }
                dog += 1
            case AnimalType.porsche:
                if let some = counts[.porsche], some != nil {
                    counts.updateValue(some + 1, forKey: .porsche)
                } else {
                    counts.updateValue(1, forKey: .porsche)
                }
                turtle += 1
            case AnimalType.lambo:
                if let some = counts[.lambo], some != nil {
                    counts.updateValue(some + 1, forKey: .lambo)
                    print(some.hashValue)
                } else {
                    counts.updateValue(1, forKey: .lambo)
                }
                rabbit += 1
            }
        }

        let biggestValue = counts.sorted{$1.value > $0.value }
        print(biggestValue)
    
    
        switch biggestValue.last!.key.rawValue {
        case "👾":
            carImage.image = UIImage(named: "vw")
            resultingAnimale.text = "Best car for you is VW"
            descriptionAnimal.text = "\(biggestValue.last!.key.definition)"
        case "💩":
               carImage.image = UIImage(named: "bmw")
            resultingAnimale.text = "Best car for you is Porsche"
            descriptionAnimal.text = "\(biggestValue.last!.key.definition)"
        case  "👻":
               carImage.image = UIImage(named: "porsche")
            resultingAnimale.text = "Best car for you is Porsche"
            descriptionAnimal.text = "\(biggestValue.last!.key.definition)"
        case "🤡":
               carImage.image = UIImage(named: "lambo")
            resultingAnimale.text = "Best car for you is Lamborghini "
            descriptionAnimal.text = "\(biggestValue.last!.key.definition)"
        default:
            print("out of range")
    }
    }
}
