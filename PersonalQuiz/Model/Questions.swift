//
//  Questions.swift
//  PersonalQuiz
//
//  Created by Andrew on 06/12/2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

struct Questions {
    var text: String
    var type: ResponseType
    var answer: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text:String
    var type: AnimalType
}

enum AnimalType: Character {
    case vw = "👾", bmw = "💩", porsche = "👻", lambo = "🤡"
    var definition:String {
        switch self {
        case .vw:
            return "VW is very comfortable and wide spread car. This car is mentioned for family. This is most quality car for less money."
        case.bmw:
            return "BMW is prestige car that is worth it price and done by VAG concerne. Teens like that brand because of car angry shapes."
        case.porsche:
            return "Porsche cars are mentioned to be driven by rich persons with comfort and speed. This brand have unic shapes and very good quality."
        case .lambo:
            return "Lamborghini is well known brand. This is ultra expensive car hovewer the speeds that this car could reach is twice higher than any other car."
        }
    }
}
