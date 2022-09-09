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
    let words: [Word]? // TODO: will be fetched if needed
    let creationDate: Date
    let note: String
    let isFavourited: Bool

    static let example = WordBundle(
        id: UUID(uuidString: "5a1e4831-df21-4b8d-aa33-dfdd19d3b5cc")!,
        name: "Example_Name", language: .georgian, icon: Image("geo"),
        words: [.basketball, .study],
        creationDate: .now,
        note: "",
        isFavourited: false
    )

    static let example2 = WordBundle(
        id: UUID(uuidString: "bd2c70b6-ede9-4df3-b538-4555e092a787")!,
        name: "Example_Name2",
        language: .georgian,
        icon: Image("eng"),
        words: [.basketball, .study],
        creationDate: .now, note: "",
        isFavourited: false
    )

    static let example3 = WordBundle(
        id: UUID(uuidString: "c22843a2-592a-461b-ab57-2724034f2324")!,
        name: "Example_Name3",
        language: .georgian,
        icon: Image("spn"),
        words: [.basketball, .study],
        creationDate: .now,
        note: "",
        isFavourited: false
    )

    static let examples = [example, example2, example3]
}

extension WordBundle {
    static func make(from entity: WordBundleEntity) -> WordBundle {
        .init(
            id: entity.id,
            name: entity.name,
            language: entity.language,
            icon: nil, // TODO: change
            words: nil, // TODO: change
            creationDate: entity.creationDate,
            note: entity.note,
            isFavourited: entity.isFavourited
        )
    }
}
