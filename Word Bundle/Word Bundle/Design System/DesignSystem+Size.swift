//
//  DesignSystem+Size.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 18.07.22.
//

import Foundation

public extension DesignSystem {
    enum Size: Double {
        case min      = 1
        case xxxSmall = 2
        case xxSmall  = 4
        case xSmall   = 8
        case small    = 12
        case medium   = 16
        case large    = 20
        case xLarge   = 24
        case xxLarge  = 32
        case xxxLarge = 48
        case max      = 64

        public func callAsFunction() -> RawValue { rawValue }
    }
}
