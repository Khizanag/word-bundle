//
//  DesignSystem+Images.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 18.07.22.
//

import SwiftUI

public extension DesignSystem {
    enum Image: String {
        case bell
        case bellBadge = "bell.badge"
        case booksAndMobile
        case booksVerticalFill = "books.vertical.fill"
        case checkmarkSquareFill = "checkmark.square.fill"
        case chevronBackward = "chevron.backward"
        case chevronDown = "chevron.down"
        case chevronRight = "chevron.right"
        case circle
        case docPlaintext = "doc.plaintext"
        case minus
        case paintbrush
        case paintbrushFill = "paintbrush.fill"
        case plus
        case scrollFill = "scroll.fill"
        case settings = "gearshape.2.fill"
        case speaker = "speaker.wave.3"
        case textBookClosedFill = "text.book.closed.fill"
        case textJustifyLeft = "text.justify.left"
        case textformat
    }
}

public extension DesignSystem.Image {
    func callAsFunction() -> SwiftUI.Image {
        imageExists(named: rawValue) ? SwiftUI.Image(rawValue) : SwiftUI.Image(systemName: rawValue)
    }

    private func imageExists(named name: String) -> Bool {
        UIImage(named: name) != nil
    }
}
