//
//  Theme.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 12.08.22.
//

import SwiftUI

struct Theme: Identifiable {
    let id: Int
    let color: Color
    let opacity = 0.8

    func getColor() -> Color {
        color.opacity(opacity)
    }
}

// MARK: - Static
extension Theme {
    static func theme(id: Int) -> Theme {
        themes.first(where: { $0.id == id }) ?? example
    }

    static var example: Theme { themes[0] }

    static let themes: [Theme] = [
        Theme(id: 0, color: .orange),
        Theme(id: 1, color: .red),
        Theme(id: 2, color: .blue),
        Theme(id: 3, color: .brown),
        Theme(id: 4, color: .pink),
        Theme(id: 5, color: .purple)
    ]
}
