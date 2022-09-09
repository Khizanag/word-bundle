//
//  Language.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 25.07.22.
//

import Foundation
import SwiftUI

public enum Language: String, CaseIterable {
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
}

extension Language {
    var localizableIdentifier: String {
        switch self {
        case .english:  return "en"
        case .french:   return "fr"
        case .gujarati: return "gu"
        case .hindi:    return "hi"
        case .latvian:  return "lv"
        case .romanian: return "ro"
        case .spanish:  return "es"
        case .swahili:  return "sw"
        case .tamil:    return "ta"
        case .georgian: return "en"
        }
    }

    var name: String { rawValue.capitalized }

    var image: Image { Image(rawValue) }
}
