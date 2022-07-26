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
    let language: Language
    let icon: Image
    let words: [Word]
    let creationDate: Date
    let note: String
    let isFavourited: Bool

    static let example = WordBundle(id: UUID(), language: .georgian, icon: Image("search"), words: [.camel, .good, .ball], creationDate: .now, note: "", isFavourited: false)
}
