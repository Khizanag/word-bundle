//
//  Device+Extension.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 23.04.22.
//

import SwiftUI
import AudioToolbox

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(1519)
    }
}
