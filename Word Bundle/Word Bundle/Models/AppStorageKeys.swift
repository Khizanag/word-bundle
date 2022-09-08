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

    func callAsFunction() -> RawValue {
        rawValue
    }
}
