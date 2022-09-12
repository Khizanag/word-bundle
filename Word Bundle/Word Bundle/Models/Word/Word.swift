//
//  Word.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import Foundation

public struct Word: Codable {
    let id: UUID
    let bundleId: UUID

    let word: String
    let lexicalEntries: [LexicalEntry]
    let pronunciation: Pronunciation
    var imageUrl: String?

    let note: String
    let isFavourited: Bool

    // MARK: - Lexical Entry
    struct LexicalEntry: Codable, Hashable {
        let entries: [Entry]
        let lexicalCategory: String
        let phrasalVerbs: [String]
        let phrases: [String]
    }

    // MARK: - Pronunciation
    struct Pronunciation: Codable {
        let audioFile: String?
        let dialects: [String]?
        let phoneticNotation: String?
        let phoneticSpelling: String?
    }

    // MARK: - Entry
    struct Entry: Codable, Hashable {
        let etymologies: [String]
        let senses: [Sense]
    }

    // MARK: - Sense
    struct Sense: Codable, Hashable {
        let antonyms: [String]
        let definitions: [String]
        let examples: [String]
        let shortDefinitions: [String]
        let synonyms: [String]
    }

    var exampleDefinition: String {
        lexicalEntries.first?.entries.first?.senses.first?.definitions.first ?? ""
    }
}

// MARK: - Equatable(s)
extension Word: Equatable { }
extension Word.LexicalEntry: Equatable { }
extension Word.Pronunciation: Equatable { }
extension Word.Entry: Equatable { }
extension Word.Sense: Equatable { }

// MARK: - Init from RetrieveEntryResponse
extension Word {
    static func make(from entity: RetrieveEntryResponse, bundleId: UUID) -> Word? {
        guard let lexicalEntries = entity.results?.first?.lexicalEntries else { return nil }
        guard let sharedLexicalEntry = lexicalEntries.first else { return nil }
        guard let sharedEntry = sharedLexicalEntry.entries?.first else { return nil }

        let pronunciationEntry = sharedEntry.pronunciations?.first

        return Word(
            id: UUID(),
            bundleId: bundleId,
            word: sharedLexicalEntry.text,
            lexicalEntries: lexicalEntries.map { lexicalEntry in
                Word.LexicalEntry(
                    entries: lexicalEntry.entries?.map { entry in
                        Word.Entry(
                            etymologies: entry.etymologies ?? [],
                            senses: entry.senses?.map { sense in
                                Word.Sense(
                                    antonyms: sense.antonyms?.map(\.text) ?? [],
                                    definitions: sense.definitions ?? [],
                                    examples: sense.examples?.map(\.text) ?? [],
                                    shortDefinitions: sense.shortDefinitions ?? [],
                                    synonyms: sense.synonyms?.map(\.text) ?? []
                                )
                            } ?? []
                        )
                    } ?? [],
                    lexicalCategory: lexicalEntry.lexicalCategory.text,
                    phrasalVerbs: lexicalEntry.phrasalVerbs?.map(\.text) ?? [],
                    phrases: lexicalEntry.phrases?.map(\.text) ?? []
                )
            },
            pronunciation: .init(
                audioFile: pronunciationEntry?.audioFile,
                dialects: pronunciationEntry?.dialects,
                phoneticNotation: pronunciationEntry?.phoneticNotation,
                phoneticSpelling: pronunciationEntry?.phoneticSpelling
            ),
            imageUrl: nil,
            note: "",
            isFavourited: false
        )
    }
}
