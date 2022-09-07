//
//  Dictionary+Extension.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 06.09.22.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    var asQueryString: String {
        self.map { $0 + "=" + $1 }.joined(separator: "&")
    }
}
