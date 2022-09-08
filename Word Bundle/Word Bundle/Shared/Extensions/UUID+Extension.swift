//
//  UUID+Extension.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 09.09.22.
//

import Foundation

extension UUID: RawRepresentable {
    public var rawValue: String {
        self.uuidString
    }

    public typealias RawValue = String

    public init?(rawValue: RawValue) {
        self.init(uuidString: rawValue)
    }
}
