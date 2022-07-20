//
//  Word.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import Foundation

struct Word {
    let word: String
    let definition: String
    let partOfSpeech: PartOfSpeech
    let examples: [String]
    let synonyms: [String]
    let antonyms: [String]
    let note: String
    let likes: Int
    let dislikes: Int
    let isFavourited: Bool
}
