//
//  WordBundle+Example.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 09.09.22.
//

import SwiftUI

extension WordBundle {
    static let example = WordBundle(
        id: UUID(uuidString: "5a1e4831-df21-4b8d-aa33-dfdd19d3b5cc")!,
        name: "Hello, World",
        language: .english,
        icon: Image("geo"),
        creationDate: .now,
        note: "",
        isFavourited: false
    )

    static let example2 = WordBundle(
        id: UUID(uuidString: "bd2c70b6-ede9-4df3-b538-4555e092a787")!,
        name: "Example_Name2",
        language: .georgian,
        icon: Image("eng"),
        creationDate: .now, note: "",
        isFavourited: false
    )

    static let example3 = WordBundle(
        id: UUID(uuidString: "c22843a2-592a-461b-ab57-2724034f2324")!,
        name: "Example_Name3",
        language: .georgian,
        icon: Image("spn"),
        creationDate: .now,
        note: "",
        isFavourited: false
    )

    static let examples = [example, example2, example3]
}
