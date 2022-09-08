//
//  WordEntity.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 08.09.22.
//

import CoreData
import SwiftUI

@objc(WordEntity)
public class WordEntity: NSManagedObject {
}

public extension WordEntity {
    @nonobjc class func fetchRequest() -> NSFetchRequest<WordEntity> {
        NSFetchRequest<WordEntity>(entityName: "WordEntity")
    }

    @NSManaged var encodedWord: Data?
}

extension WordEntity: Identifiable {
}

// MARK: - Word.init
extension Word {
    static func make(from entity: WordEntity) -> Word? {
        guard let encodedWord = entity.encodedWord else { return nil }
        do {
            let word = try JSONDecoder().decode(Word.self, from: encodedWord)
            return word
        } catch {
            // TODO: error handling
            return nil
        }
    }
}
