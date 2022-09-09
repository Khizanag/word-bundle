//
//  AppStorageKeys.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 08.09.22.
//

import Foundation

enum AppStorageKeys: String {
    case chosenThemeId
    case activeWordBundleId
    case isFirstRun
    case hasCompletedOnboarding

    func callAsFunction() -> RawValue {
        rawValue
    }
}
