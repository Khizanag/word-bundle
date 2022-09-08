//
//  WordEntity.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 08.09.22.
//

import CoreData
import SwiftUI

@objc(WordEntity)
public class WordEntity: NSManagedObject { }

public extension WordEntity {
    @nonobjc class func fetchRequest() -> NSFetchRequest<WordEntity> {
        NSFetchRequest<WordEntity>(entityName: "WordEntity")
    }

    @NSManaged var id: UUID
    @NSManaged var bundleId: UUID
    @NSManaged var encodedWord: Data
}

extension WordEntity: Identifiable { }

// MARK: - Word.init
extension Word {
    static func make(from entity: WordEntity) -> Word? {
        try? JSONDecoder().decode(Word.self, from: entity.encodedWord)
    }
}
