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

        func callAsFunction() -> SwiftUI.Image {
            SwiftUI.Image(rawValue)
        }
    }
}
