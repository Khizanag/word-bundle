//
//  ReminderSettingItem.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct ReminderSettingItem: View {
    // MARK: - Properties
    let title: String
    let countDisplayer: (Int) -> String
    let countUpdater: (Int, Int) -> Int

    @State var count: Int

    // MARK: - Example
    static var example = ReminderSettingItem(title: Localisation.howMany(), count: 10, countDisplayer: { $0.toString() }, countUpdater: { $0 + $1 })

    // MARK: - Init
    init(title: String, count: Int, countDisplayer: @escaping (Int) -> String, countUpdater: @escaping (Int, Int) -> Int) {
        self.title = title
        self.count = count
        self.countDisplayer = countDisplayer
        self.countUpdater = countUpdater
    }

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Button("-") { // FIXME: minus icon
                count = countUpdater(count, -1)
            }
            Text(countDisplayer(count))
                .frame(width: 64) // FIXME: to design system
            Button("+") { // FIXME: plus icon
                count = countUpdater(count, +1)
            }
        }
        .padding()
        .background(DesignSystem.Color.secondaryBackground().value)
        .cornerRadius(DesignSystem.Size.xSmall())
    }
}

// MARK: - Previews
struct ReminderSettingItem_Previews: PreviewProvider {
    static var previews: some View {
        ReminderSettingItem.example
    }
}
