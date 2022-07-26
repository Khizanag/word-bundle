//
//  ReminderSettingItem.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct ReminderSettingItem<Value>: View {
    // MARK: - Properties
    let title: String
    @State var value: Value
    let valueDisplayer: (Value) -> String
    let valueUpdater: (Value, Int) -> Value

    // MARK: - Init
    init(
        title: String,
        value: Value,
        valueDisplayer: @escaping (Value) -> String,
        valueUpdater: @escaping (Value, Int) -> Value
    ) {
        self.title = title
        self._value = State(initialValue: value)
        self.valueDisplayer = valueDisplayer
        self.valueUpdater = valueUpdater
    }

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Button("-") { // FIXME: minus icon
                value = valueUpdater(value, -1)
            }
            Text(valueDisplayer(value))
                .frame(width: 64) // FIXME: to design system
            Button("+") { // FIXME: plus icon
                value = valueUpdater(value, +1)
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
        ReminderSettingItem(title: Localisation.howMany(), value: 0, valueDisplayer: { $0.toString() }, valueUpdater: +)
    }
}
