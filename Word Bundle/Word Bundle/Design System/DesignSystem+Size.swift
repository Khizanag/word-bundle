//
//  DesignSystem+Size.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 18.07.22.
//

import Foundation

public extension DesignSystem {
    enum Size: Double {
        // TODO: think about changing naming
        case xxxLarge = 32
        case xxLarge  = 24
        case xLarge   = 20
        case large    = 16
        case medium   = 12
        case small    = 8
        case xSmall   = 4
        case xxSmall  = 2
        case xxxSmall = 1

        public func callAsFunction() -> Double {
            rawValue
        }
    }
}
