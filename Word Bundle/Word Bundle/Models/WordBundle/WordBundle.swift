//
//  Bundle.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 26.07.22.
//

import Foundation
import SwiftUI

struct WordBundle {
    let id: UUID
    let name: String
    let language: Language
    let icon: Image?
    let creationDate: Date
    let note: String
    let isFavourited: Bool
}

extension WordBundle {
    static func make(from entity: WordBundleEntity) -> WordBundle {
        .init(
            id: entity.id,
            name: entity.name,
            language: entity.language,
            icon: nil, // TODO: change
            creationDate: entity.creationDate,
            note: entity.note,
            isFavourited: entity.isFavourited
        )
    }
}
