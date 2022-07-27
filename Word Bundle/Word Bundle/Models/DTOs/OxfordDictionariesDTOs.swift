//
//  OxfordDictionariesDTOs.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 27.07.22.
//

import Foundation

/// https://developer.oxforddictionaries.com/documentation#/Entries

struct RetrieveEntryOriginal {
    let metadata: Metadata?
    let results: [HeadwordEntry]?

    struct HeadwordEntry {
        let id: String
        let language: String
        let lexicalEntries: [LexicalEntry]
        let pronunciations: [Pronunciation]?
        let type: String?
        let word: String // DEPRECATED TODO: remove?
    }

    struct Metadata {
        let operation: String
        let provider: String
        let schema: String
    }

    struct LexicalEntry {
        let compounds: [RelatedEntry]?
        let derivativeOf: [RelatedEntry]?
        let derivatives: [RelatedEntry]?
        let entries: [Entry]?
        let grammaticalFeatures: [GrammaticalFeature]?
        let language: String
        let lexicalCategory: LexicalCategory
        let notes: [CategorizedText]?
        let phrasalVerbs: [RelatedEntry]?
        let phrases: [RelatedEntry]?
        let pronunciations: [Pronunciation]?
        let root: String?
        let text: String
        let variantForms: [VariantForm]?
    }

    struct Entry {
        let crossReferenceMarkers: [String]?
        let crossReferences: [CrossReference]?
        let etymologies: [String]?
        let grammaticalFeatures: [GrammaticalFeature]?
        let homographNumber: String?
        let inflections: [InflectedForm]?
        let notes: [CategorizedText]?
        let pronunciations: [Pronunciation]?
        let senses: [Sense]?
        let variantForms: [VariantForm]?
    }

    struct Pronunciation {
        let audioFile: String? /// The URL of the sound file
        let dialects: [String]?
        let phoneticNotation: String?
        let phoneticSpelling: String?
        let regions: [Region]?
        let registers: [Register]?
    }

    struct RelatedEntry {
        let domains: [Domain]?
        let id: String
        let language: String?
        let regions: [Region]?
        let registers: [Register]?
        let text: String
    }

    struct InflectedForm {
        let domains: [Domain]?
        let grammaticalFeatures: [GrammaticalFeature]?
        let inflectedForm: String
        let lexicalCategory: LexicalCategory?
        let pronunciations: [Pronunciation]?
        let regions: [Region]?
        let registers: [Register]?
    }

    struct Sense {
        let antonyms: [SynonymsAntonym]?
        let constructions: [Construction]?
        let crossReferenceMarkers: [String]?
        let crossReferences: [CrossReference]?
        let definitions: [String]?
        let domainClasses: [DomainClass]?
        let domains: [Domain]?
        let etymologies: [String]
        let examples: [Example]?
        let id: String?
        let inflections: [InflectedForm]?
        let notes: [CategorizedText]?
        let pronunciations: [Pronunciation]?
        let regions: [Region]?
        let registers: [Register]?
        let semanticClasses: [SemanticClass]?
        let shortDefinitions: [String]?
        let subsenses: [Sense]?
        let synonyms: [SynonymsAntonym]?
        let thesaurusLinks: [ThesaurusLink]?
        let variantForms: [VariantForm]?
    }

    struct GrammaticalFeature {
        let id: String
        let text: String
        let type: String
    }

    struct CategorizedText {
        let id: String?
        let text: String
        let type: String
    }

    struct VariantForm {
        let domains: [Domain]?
        let notes: [CategorizedText]?
        let pronunciations: [Pronunciation]?
        let regions: [Region]?
        let registers: [Register]?
        let text: String
    }

    struct CrossReference {
        let id: String
        let text: String
        let type: String
    }

    struct Construction {
        let domains: [Domain]?
        let examples: [[String]]?
        let notes: [CategorizedText]?
        let regions: [Region]?
        let registers: [Register]?
        let text: String
    }

    struct ThesaurusLink {
        let entry_id: String
        let sense_id: String
    }

    struct SynonymsAntonym {
        let domains: [Domain]?
        let id: String?
        let language: String?
        let regions: [Region]?
        let registers: [Register]?
        let text: String
    }

    struct Example {
        let definitions: [String]?
        let domains: [Domain]?
        let notes: [CategorizedText]?
        let regions: [Region]?
        let registers: [Register]?
        let senseIds: [String]?
        let text: String
    }

    struct IdText {
        let id: String
        let text: String
    }

    typealias SemanticClass = IdText
    typealias Region = IdText
    typealias Register = IdText
    typealias Domain = IdText
    typealias DomainClass = IdText
    typealias LexicalCategory = IdText
}
