//
//  Theme.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 12.08.22.
//

import SwiftUI

struct Theme: Identifiable {
    let id: Int
    let isEmpty: Bool
    let color: Color

    static var example: Theme { themes[0] }

    static func theme(id: Int) -> Theme {
        themes.first(where: { $0.id == id }) ?? themes[0]
    }

    static let themes: [Theme] = [
        Theme(id: 0, isEmpty: true, color: .accentColor),
        Theme(id: 1, isEmpty: false, color: .red),
        Theme(id: 2, isEmpty: false, color: .blue),
        Theme(id: 3, isEmpty: false, color: .brown),
        Theme(id: 4, isEmpty: false, color: .pink),
        Theme(id: 5, isEmpty: false, color: .purple),
        Theme(id: 6, isEmpty: false, color: .orange)
    ]
}
