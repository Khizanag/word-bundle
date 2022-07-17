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
        case color1(opacity: Double)
        case color2(opacity: Double)
        case color3(opacity: Double)
        case color4(opacity: Double)
        case color5(opacity: Double)
        case color6(opacity: Double)

        public var value: SwiftUI.Color {
            switch self {
            case .color1(let opacity): return .init(storeName).opacity(opacity)
            case .color2(let opacity): return .init(storeName).opacity(opacity)
            case .color3(let opacity): return .init(storeName).opacity(opacity)
            case .color4(let opacity): return .init(storeName).opacity(opacity)
            case .color5(let opacity): return .init(storeName).opacity(opacity)
            case .color6(let opacity): return .init(storeName).opacity(opacity)
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
            }
        }
    }
}
