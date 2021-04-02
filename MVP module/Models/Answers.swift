//
//  Answers.swift
//  What animal should i get?
//
//  Created by Tanya on 25.03.2021.
//
import Foundation

struct Answer: Decodable {
    let text: String
    let type: AnimalType
}

enum AnimalType: Character, Decodable {
    case cat = "🐈"
    case dog = "🐩"
    case mouse = "🦝"
    case fish = "🐠"
    
    enum CodingKeys: String, CodingKey {
        case codingCat = "cat"
        case codingDog = "dog"
        case codingMouse = "mouse"
        case codingFish = "fish"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if (try? container.decode(String.self, forKey: .codingCat)) != nil {
            self = .cat
            return
        }
        else if (try? container.decode(String.self, forKey: .codingDog)) != nil {
            self = .dog
            return
        }
        else if (try? container.decode(String.self, forKey: .codingFish)) != nil {
            self = .fish
            return
        }
        else if (try? container.decode(String.self, forKey: .codingMouse)) != nil {
            self = .mouse
            return
        }
        else {
            self = .cat
            return
        }
    }
    
    var definitionAnimal: String {
        
        switch self {
        case .cat:
            return NSLocalizedString("MVP module.Models.Answers.var definitionAnimal.case .cat", comment: "")
        case .dog:
            return NSLocalizedString("MVP module.Models.Answers.var definitionAnimal.case .dog", comment: "")
        case .mouse:
            return NSLocalizedString("MVP module.Models.Answers.var definitionAnimal.case .mouse", comment: "")
        case .fish:
            return NSLocalizedString("MVP module.Models.Answers.var definitionAnimal.case .fish", comment: "")
        }
    }
}

