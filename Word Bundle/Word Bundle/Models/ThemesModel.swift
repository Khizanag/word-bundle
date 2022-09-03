//
//  ThemesModel.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 12.08.22.
//

import Foundation
import SwiftUI

class ThemesModel: ObservableObject {
    @Published var themes: [Theme]

    init() {
        themes = Theme.themes
    }

    func selectTheme(theme: Theme) { // TODO: rename 'choose'
        cancelSelectedTheme()
        for (index, item) in themes.enumerated() where item.id == theme.id {
            themes[index].isSelected = true
        }
    }

    func getSelectedTheme() -> Theme? {
        themes.first(where: { $0.isSelected })
    }

    private func getSelectedThemeIndex() -> Int? {
        themes.firstIndex(where: { $0.isSelected })
    }

    private func cancelSelectedTheme() {
        if let index = getSelectedThemeIndex() {
            themes[index].isSelected = false
        }
    }
}
