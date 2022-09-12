//
//  ReminderSettingItem.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct ReminderSettingItem<Value>: View {
    // MARK: - Properties
    private let title: String
    private let valueDisplayer: (Value) -> String
    private let valueUpdater: (Value, Int) -> Value

    @State private var value: Value

    // MARK: - Init
    init(title: String, value: Value, valueDisplayer: @escaping (Value) -> String, valueUpdater: @escaping (Value, Int) -> Value) {
        self.title = title
        self._value = State(initialValue: value)
        self.valueDisplayer = valueDisplayer
        self.valueUpdater = valueUpdater
    }

    var body: some View {
        HStack {
            Text(title)
            Spacer()

            minusButton

            Text(valueDisplayer(value))
                .frame(width: 64) // FIXME: to design system

            plusButton
        }
        .padding()
        .background(DesignSystem.Color.secondaryBackground())
        .cornerRadius(DesignSystem.Size.xxSmall())
    }

    private var minusButton: some View {
        Button(
            action: {
                value = valueUpdater(value, -1)
            },
            label: {
                DesignSystem.Image.minus()
                    .foregroundColor(Color(hex: 0x3F3F3F))
            }
        )
    }

    private var plusButton: some View {
        Button(
            action: {
                value = valueUpdater(value, +1)
            },
            label: {
                DesignSystem.Image.plus()
                    .foregroundColor(Color(hex: 0x3F3F3F))
            }
        )
    }
}

// MARK: - Previews
struct ReminderSettingItem_Previews: PreviewProvider {
    static var previews: some View {
        ReminderSettingItem(title: Localisation.howMany(), value: 10, valueDisplayer: { $0.toString() }, valueUpdater: +)
    }
}
