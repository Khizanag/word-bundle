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
    case reminders
    case remindersSettingPageTitle

    // MARK: - Words
    case wordSalubrious
    case wordSalubriousDefinition

    // MARK: - Shared
    case endAt
    case getStarted
    case home
    case howMany
    case startAt
    case wordBundle

    private var localized: String {
        NSLocalizedString(rawValue, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

    public func callAsFunction() -> String {
        localized
    }
}
