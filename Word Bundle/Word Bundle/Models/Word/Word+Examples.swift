//
//  Word+Examples.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 26.07.22.
//

import Foundation

extension Word {
    // MARK: - Basketball
    static let basketball = Word(
        id: .init(),
        bundleId: .init(),
        word: "Basketball",
        lexicalEntries: [
            .init(
                entries: [
                    .init(
                        etymologies: [],
                        senses: [
                            .init(
                                antonyms: [],
                                definitions: [
                                    "a game played between two teams of five players in which goals are scored by throwing a ball through a netted hoop fixed at each end of the court"
                                ],
                                examples: [
                                    "I played basketball at college",
                                    "the team had not won a basketball game in over a month"
                                ],
                                shortDefinitions: [
                                    "game in which goals are scored by throwing ball through hoop"
                                ],
                                synonyms: []
                            )
                        ]
                    )
                ],
                lexicalCategory: "Noun",
                phrasalVerbs: [],
                phrases: []
            )
        ],
        pronunciation: .init(
            audioFile: "https://audio.oxforddictionaries.com/en/mp3/basketball__gb_3.mp3",
            dialects: ["British English"],
            phoneticNotation: "IPA",
            phoneticSpelling: "ˈbɑːskɪtbɔːl"
        ),
        imageUrl: nil,
        note: "",
        isFavourited: false
    )

    // MARK: - Study
    static let study = Word(
        id: .init(),
        bundleId: .init(),
        word: "Study",
        lexicalEntries: [
            .init(
                entries: [
                    .init(
                        etymologies: [
                            "Middle English: shortening of Old French estudie (noun), estudier (verb), both based on Latin studium ‘zeal, painstaking application’"
                        ],
                        senses: [
                            .init(
                                antonyms: [],
                                definitions: [
                                    "the devotion of time and attention to gaining knowledge of an academic subject, especially by means of books"
                                ],
                                examples: [
                                    "the study of English",
                                    "an application to continue full-time study"
                                ],
                                shortDefinitions: [
                                    "devotion of time and attention to gaining knowledge of academic subject"
                                ],
                                synonyms: [
                                    "learning", "education", "schooling", "work", "academic work", "book work", "scholarship", "tuition", "research"
                                ]
                            ),
                            .init(
                                antonyms: [],
                                definitions: [
                                    "a detailed investigation and analysis of a subject or situation"
                                ],
                                examples: [
                                    "a study of a sample of 5,000 children", "the study of global problems"
                                ], shortDefinitions: [
                                    "detailed investigation and analysis of subject or situation"
                                ],
                                synonyms: [
                                    "investigation", "inquiry", "research", "examination", "analysis", "review", "survey", "scrutiny", "evaluation", "interpretation"
                                ]
                            ),
                            .init(
                                antonyms: [],
                                definitions: [
                                    "a room used or designed for reading, writing, or academic work"
                                ],
                                examples: [
                                    "the third bedroom was used as a study"
                                ],
                                shortDefinitions: [
                                    "room used or designed for reading, writing, or academic work"
                                ],
                                synonyms: [
                                    "office", "workroom", "workplace", "place of work", "studio", "library"
                                ]
                            ),
                            .init(
                                antonyms: [],
                                definitions: [
                                    "a piece of work, especially a drawing, done for practice or as an experiment."
                                ],
                                examples: [],
                                shortDefinitions: [
                                    "piece of work done for practice or as experiment"
                                ],
                                synonyms: [
                                    "essay", "article", "piece", "work", "review", "report", "paper", "dissertation", "commentary", "discourse", "critique", "disquisition"
                                ]
                            ),
                            .init(
                                antonyms: [],
                                definitions: [
                                    "a thing or person that is an embodiment or good example of something"
                                ],
                                examples: [
                                    "he perched on the edge of the bed, a study in confusion and misery"
                                ],
                                shortDefinitions: [
                                    "thing or person that is embodiment or good example of something"
                                ],
                                synonyms: []
                            )
                        ]
                    )
                ],
                lexicalCategory: "Noun",
                phrasalVerbs: [],
                phrases: [
                    "in a brown study"
                ]
            ),
            .init(
                entries: [
                    .init(
                        etymologies: [],
                        senses: [
                            .init(
                                antonyms: [],
                                definitions: [
                                    "devote time and attention to gaining knowledge of (an academic subject), especially by means of books"
                                ],
                                examples: [
                                    "I studied classics at college"
                                ],
                                shortDefinitions: [
                                    "devote time and attention to gaining knowledge of academic subject"
                                ],
                                synonyms: [
                                    "learn", "read", "read up on", "work at", "be taught", "be tutored in"
                                ]
                            ),
                            .init(
                                antonyms: [],
                                definitions: [
                                    "look at closely in order to observe or read"
                                ],
                                examples: [
                                    "she bent her head to study the plans"
                                ],
                                shortDefinitions: [
                                    "look at closely in order to observe or read"
                                ],
                                synonyms: []
                            ),
                            .init(
                                antonyms: [],
                                definitions: [
                                    "make an effort to achieve (a result) or take into account (a person or their wishes)"
                                ],
                                examples: [
                                    "with no husband to study, housekeeping is mere play"
                                ],
                                shortDefinitions: [
                                    "make effort to achieve result or take into account"
                                ],
                                synonyms: []
                            )
                        ]
                    )
                ],
                lexicalCategory: "Verb",
                phrasalVerbs: [],
                phrases: [
                    "in a brown study"
                ]
            )
        ],
        pronunciation: .init(
            audioFile: "https://audio.oxforddictionaries.com/en/mp3/study__gb_1.mp3",
            dialects: ["British English"],
            phoneticNotation: "IPA",
            phoneticSpelling: "ˈstʌdi"
        ),
        imageUrl: nil,
        note: "",
        isFavourited: false
    )
    // TODO: add more example words
}
