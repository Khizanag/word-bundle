//
//  DesignSystem+Color.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 18.07.22.
//

import SwiftUI

public extension DesignSystem {
    enum Color: String {
        // TODO: change to appropriate naming
        case color1
        case color2
        case color3
        case color4
        case color5
        case color6
        case primaryTextDark
        case primaryTextLight
        case secondaryTextDark
        case secondaryTextLight
        case secondaryBackground

        private var storeName: String { rawValue }

        func callAsFunction() -> SwiftUI.Color { .init(storeName) }
    }
}
