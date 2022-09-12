//
//  WordBundleEntity.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 09.09.22.
//

import Foundation
import CoreData

@objc(WordBundleEntity)
public class WordBundleEntity: NSManagedObject { }

extension WordBundleEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordBundleEntity> {
        NSFetchRequest<WordBundleEntity>(entityName: "WordBundleEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var creationDate: Date
    @NSManaged public var note: String
    @NSManaged public var isFavourited: Bool

    @NSManaged private var languageValue: String

    public var language: Language {
        get {
            Language(rawValue: languageValue) ?? .english
        }
        set {
            languageValue = newValue.rawValue
        }
    }
}

extension WordBundleEntity: Identifiable { }
