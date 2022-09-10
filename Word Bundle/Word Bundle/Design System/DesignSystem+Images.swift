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
        case booksAndMobile
        case circle
        case textformat
        case plus
        case minus
        case paintbrush
        case docPlaintext = "doc.plaintext"
        case chevronBackward = "chevron.backward"
        case chevronRight = "chevron.right"
        case chevronDown = "chevron.down"
        case checkmarkSquareFill = "checkmark.square.fill"
        case speakerWave3 = "speaker.wave.3"
        case bellBadge = "bell.badge"
        case textJustifyLeft = "text.justify.left"
        case booksVerticalFill = "books.vertical.fill"
        case paintbrushFill = "paintbrush.fill"
        case scrollFill = "scroll.fill"
        case textBookClosedFill = "text.book.closed.fill"
        case gearshape2Fill = "gearshape.2.fill"

        func callAsFunction(isSystemName: Bool = true) -> SwiftUI.Image {
            if isSystemName {
                return SwiftUI.Image(systemName: rawValue)
            }
            return SwiftUI.Image(rawValue)
        }
    }
}
