//
//  DesignSystem+Color.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 18.07.22.
//

import SwiftUI

public extension DesignSystem {
    enum Color {
        // TODO: change to appropriate naming
        case color1(opacity: Double = 1)
        case color2(opacity: Double = 1)
        case color3(opacity: Double = 1)
        case color4(opacity: Double = 1)
        case color5(opacity: Double = 1)
        case color6(opacity: Double = 1)
        case primaryTextDark(opacity: Double = 1)
        case primaryTextLight(opacity: Double = 1)
        case secondaryTextDark(opacity: Double = 1)
        case secondaryTextLight(opacity: Double = 1)

        public var value: SwiftUI.Color {
            switch self {
            case .color1(let opacity):             return .init(storeName).opacity(opacity)
            case .color2(let opacity):             return .init(storeName).opacity(opacity)
            case .color3(let opacity):             return .init(storeName).opacity(opacity)
            case .color4(let opacity):             return .init(storeName).opacity(opacity)
            case .color5(let opacity):             return .init(storeName).opacity(opacity)
            case .color6(let opacity):             return .init(storeName).opacity(opacity)
            case .primaryTextDark(let opacity):    return .init(storeName).opacity(opacity)
            case .primaryTextLight(let opacity):   return .init(storeName).opacity(opacity)
            case .secondaryTextDark(let opacity):  return .init(storeName).opacity(opacity)
            case .secondaryTextLight(let opacity): return .init(storeName).opacity(opacity)
            }
        }

        private var storeName: String {
            switch self {
            case .color1: return "color1"
            case .color2: return "color2"
            case .color3: return "color3"
            case .color4: return "color4"
            case .color5: return "color5"
            case .color6: return "color6"
            case .primaryTextDark: return "primaryTextDark"
            case .primaryTextLight: return "primaryTextLight"
            case .secondaryTextDark: return "secondaryTextDark"
            case .secondaryTextLight: return "secondaryTextLight"
            }
        }

        func callAsFunction() -> SwiftUI.Color {
            value
        }
    }
}
