//
//  PartOfSpeech.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

enum PartOfSpeech {
    case noun
    case pronoun
    case verb
    case adjective
    case adverb
    case preposition
    case conjunction
    case interjection
}

extension PartOfSpeech {
    // FIXME: correct forms
    var shortTitle: String {
        switch self {
        case .noun: return "nou"
        case .pronoun: return "pron"
        case .verb: return "verb"
        case .adjective: return "adj"
        case .adverb: return "adv"
        case .preposition: return "prep"
        case .conjunction: return "conj"
        case .interjection: return "int"
        }
    }
}
