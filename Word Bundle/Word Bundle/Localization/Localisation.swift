//
//  Localisation.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import Foundation

public enum Localisation: String {
    // MARK: - Welcome Page
    case welcomePageTitle
    case welcomePageDescription

    // MARK: - Reminders Setting Page
    case remindersSettingPageTitle

    // MARK: - Words
    case wordSalubrious
    case wordSalubriousDefinition

    // MARK: - Shared
    case endAt
    case getStarted
    case howMany
    case startAt

    private var localized: String {
        NSLocalizedString(rawValue, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    public func callAsFunction() -> String {
        localized
    }
}
