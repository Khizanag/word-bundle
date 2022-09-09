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
        case docPlaintext = "doc.plaintext"
        case chevronBackward = "chevron.backward"
        case checkmarkSquareFill = "checkmark.square.fill"
        case plus

        func callAsFunction(isSystemName: Bool = true) -> SwiftUI.Image {
            if isSystemName {
                return SwiftUI.Image(systemName: rawValue)
            }
            return SwiftUI.Image(rawValue)
        }
    }
    
}
