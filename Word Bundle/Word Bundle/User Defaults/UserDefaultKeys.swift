//
//  UserDefaultKeys.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import Foundation

public enum UserDefaultKeys: String {
    case isRemindersSetupFinished

    func callAsFunction() -> String { rawValue }
}
