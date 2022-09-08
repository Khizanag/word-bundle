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
