//
//  Language.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 25.07.22.
//

import Foundation
import SwiftUI

public enum Language: String, CaseIterable {
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
}

extension Language {
    var localizableIdentifier: String {
        switch self {
        case .armenian: return "en"
        case .azerbaijani: return "en"
        case .bengali: return "en"
        case .czech: return "en"
        case .dutch: return "en"
        case .egyptianArabic: return "en"
        case .english: return "en"
        case .french: return "en"
        case .georgian: return "ka"
        case .german: return "en"
        case .greek: return "en"
        case .hindi: return "en"
        case .hungarian: return "en"
        case .iranianPersian: return "en"
        case .italian: return "en"
        case .japanese: return "en"
        case .kazakh: return "en"
        case .korean: return "en"
        case .mandarinChinese: return "en"
        case .nepali: return "en"
        case .polish: return "en"
        case .portuguese: return "en"
        case .romanian: return "en"
        case .spanish: return "en"
        case .thai: return "en"
        case .turkish: return "en"
        case .ukrainian: return "en"
        case .vietnamese: return "en"
        }
    }
    
    var name: String { rawValue.capitalized }
    
    var image: Image { Image(rawValue) }
}
