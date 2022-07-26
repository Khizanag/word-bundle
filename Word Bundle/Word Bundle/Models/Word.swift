//
//  Word.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import Foundation

struct Word {
    let id: UUID
    let bundle: WordBundle
    let language: Language
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

    static let example = Word(
        id: UUID(),
        bundle: WordBundle.example,
        language: .georgian,
        word: "Ball",
        definition: "round thing",
        partOfSpeech: .adverb,
        examples: [],
        synonyms: [],
        antonyms: [],
        note: "",
        likes: 3,
        dislikes: 1,
        isFavourited: true
    )
}
