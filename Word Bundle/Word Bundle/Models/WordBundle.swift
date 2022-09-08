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
    let icon: Image
    let words: [Word]
    let creationDate: Date
    let note: String
    let isFavourited: Bool

    static let example = WordBundle(id: UUID(), name: "Example_Name", language: .georgian, icon: Image("geo"), words: [.basketball, .study], creationDate: .now, note: "", isFavourited: false)
    static let example2 = WordBundle(id: UUID(), name: "Example_Name2", language: .georgian, icon: Image("eng"), words: [.basketball, .study], creationDate: .now, note: "", isFavourited: false)
    static let example3 = WordBundle(id: UUID(), name: "Example_Name3", language: .georgian, icon: Image("spn"), words: [.basketball, .study], creationDate: .now, note: "", isFavourited: false)

    static let examples = [example, example2, example3]
}
