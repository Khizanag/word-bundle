//
//  OptionalString+Extension.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 23.04.22.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }
}
