//
//  Localisation.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

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
    case bundles
    case themes
    case words
    case settings
    case howMany
    case startAt
    case wordBundle

    // MARK: - Languages
    case english
    case french
    case gujarati
    case hindi
    case latvian
    case romanian
    case spanish
    case swahili
    case tamil
    case georgian

    // MARK: - CreateWordBundleView
    case language
    case title
    case keepGoing
    case createBundle
    case backToLanguagePage
    case chooseLanguage
    case addBundleTitle
    case typeBundleTitle

    // MARK: - WordBundlesView
    case delete
    case bundleDeleteActionSheetTitle
    case bundleDeleteActionSheetMessage

    // MARK: - WordView
    case phrases
    case examples
    case synonyms
    case antonyms
    case definitions
    case shortDefinitions

    // MARK: - SettingsView
    case reminderSettings
    case changeBackgroundTheme

    // MARK: - WordBundleView
    case textFieldMessage
    case addWord

    // MARK: - HomeView
    case examplesNotFound

    // MARK: - AddWordBundleItemView
    case addNewBundle
}

extension Localisation {
    private var key: String { rawValue }

    private var localized: String {
        let language: Language = (UserDefaults.standard.object(forKey: "language") as? Language) ?? .georgian
        let path = Bundle.main.path(forResource: language.localizableIdentifier, ofType: "lproj")
        let bundle = Bundle(path: path!)!

        return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "", comment: "")
    }

    public func callAsFunction() -> String { localized }
}
