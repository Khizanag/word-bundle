//
//  Theme.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 12.08.22.
//

import Foundation
import SwiftUI

struct Theme: Identifiable {
    let id: Int // TODO: change type
    let isEmpty: Bool
    let color: Color // TODO: maybe replace with image?
    var isSelected: Bool = false

    static let themes: [Theme] = [
        .init(id: 1, isEmpty: true, color: .accentColor),
        .init(id: 2, isEmpty: false, color: .red),
        .init(id: 3, isEmpty: false, color: .blue),
        .init(id: 4, isEmpty: false, color: .brown),
        .init(id: 5, isEmpty: false, color: .pink),
        .init(id: 6, isEmpty: false, color: .purple),
        .init(id: 7, isEmpty: false, color: .orange, isSelected: true)
    ]
}
