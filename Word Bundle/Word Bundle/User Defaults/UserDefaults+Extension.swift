//
//  UserDefaults+Extension.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import Foundation

public extension UserDefaults {
    func set(_ value: Any?, forKey key: UserDefaultKeys) {
        UserDefaults.standard.set(value, forKey: key())
    }
}
