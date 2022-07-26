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
    case howMany
    case startAt
    case wordBundle

    // MARK: - Languages
    case armenian
    case azerbaijani
    case bengali
    case czech
    case dutch
    case egyptianArabic
    case english
    case french
    case georgian
    case german
    case greek
    case hindi
    case hungarian
    case iranianPersian
    case italian
    case japanese
    case kazakh
    case korean
    case mandarinChinese
    case nepali
    case polish
    case portuguese
    case romanian
    case spanish
    case thai
    case turkish
    case ukrainian
    case vietnamese

    private var localized: String {
        let language: Language = UserDefaults.standard.object(forKey: "language") as? Language ?? .georgian
        let path = Bundle.main.path(forResource: language.localizableIdentifier, ofType: "lproj")
        let bundle = Bundle(path: path!)!

        return NSLocalizedString(rawValue, tableName: nil, bundle: bundle, value: "", comment: "")
    }

    public func callAsFunction() -> String {
        localized
    }
}
