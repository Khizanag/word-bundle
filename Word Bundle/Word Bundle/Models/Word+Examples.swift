//
//  Word+Examples.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 26.07.22.
//

import Foundation

extension Word {
    // MARK: - Camel
    static let camel = Word(
        id: UUID(),
        bundleId: UUID(),
        language: .english,
        word: "Camel",
        definition: "even-toed ungulate in the genus Camelus that bears distinctive fatty deposits known as \"humps\" on its back",
        partOfSpeech: .noun,
        examples: [
            "Camels do not walk on their hooves",
            "Bactrian camels have a firmer foot",
            "In severe heat a camel survives four to seven days without drinking"
        ],
        synonyms: ["dromedary", "bactrian-camel", "goat", "sheep", "llama"],
        antonyms: [],
        note: "", likes: 3, dislikes: 1, isFavourited: true
    )

    // MARK: - Good
    static let good = Word(
        id: UUID(),
        bundleId: UUID(),
        language: .english,
        word: "Good",
        definition: "to be desired or approved of / having the required qualities; of a high standard",
        partOfSpeech: .adjective,
        examples: [
            "If Bishop has taken any lessons with him over the past century, the most important ones are to put faith first and try to be good",
            "It was needed because nobody trusted anybody, with very good reason",
            "There was already good reason not to believe this at the time"
        ],
        synonyms: ["efficient", "useful", "healthy", "strong"],
        antonyms: ["groundless", "illogical", "bad", "invalid"],
        note: "", likes: 4, dislikes: 0, isFavourited: false
    )

    // MARK: - Ball
    static let ball = Word(
        id: UUID(),
        bundleId: UUID(),
        language: .english,
        word: "Ball",
        definition: "a solid or hollow spherical or egg-shaped object that is kicked, thrown, or hit in a gam",
        partOfSpeech: .noun,
        examples: [
            "a cricket ball",
            "a ball of wool",
            "he comes across a group of kids playing ball",
            "Anne danced with the captain at a fancy-dress ball"
        ],
        synonyms: [],
        antonyms: [],
        note: "",
        likes: 3,
        dislikes: 1,
        isFavourited: true
    )
}
