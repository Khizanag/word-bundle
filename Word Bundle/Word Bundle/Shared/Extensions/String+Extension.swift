//
//  String+Extension.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 23.04.22.
//

import Foundation

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    mutating func trim() {
        self = self.trimmed()
    }

    var isAlphanumeric: Bool {
        !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }

    func deletingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else {
            return self
        }

        return String(dropFirst(prefix.count))
    }

    func capitalizeFirstLetter() -> String { // TODO: discuss if it needs to be mutating
        return capitalizingFirstLetter()
    }
    
    private func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    // MARK: - Subscript(s)
    subscript (i: Int) -> Character {
        self[index(startIndex, offsetBy: i)]
    }

    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < start { return "" }
        return self[start..<end]
    }

    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < start { return "" }
        return self[start...end]
    }

    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        if end < start { return "" }
        return self[start...end]
    }

    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < startIndex { return "" }
        return self[startIndex...end]
    }

    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        if end < startIndex { return "" }
        return self[startIndex..<end]
    }
}
