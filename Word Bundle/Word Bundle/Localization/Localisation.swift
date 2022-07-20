//
//  Localisation.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import Foundation

public enum Localisation: String {
    case welcomePageTitle
    case welcomePageDescription

    case getStarted

    private var localized: String {
        NSLocalizedString(rawValue, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    public func callAsFunction() -> String {
        localized
    }
}
