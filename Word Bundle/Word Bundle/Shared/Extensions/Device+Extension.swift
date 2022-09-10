//
//  Device+Extension.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 23.04.22.
//

import AudioToolbox
import SwiftUI

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(1519)
    }
}
