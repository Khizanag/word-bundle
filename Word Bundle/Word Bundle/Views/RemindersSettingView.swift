//
//  RemindersSettingView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct RemindersSettingView: View {
    // MARK: - Body
    var body: some View {
        exampleWordComponentView
        Spacer()
        titleLabel
        properties
        Spacer()
        NavigationButton(buttonTitle: Localisation.getStarted(), navigationTitle: Localisation.reminders().capitalized, destination: MainView())
        Spacer()
    }

    var exampleWordComponentView: some View {
        HStack {
            // FIXME: icon should be lefter
            DesignSystem.Image.bell()
                .padding()
            VStack(alignment: .leading) {
                HStack {
                    Text(Localisation.wordSalubrious())
                        .fontWeight(.bold)
                        .foregroundColor(DesignSystem.Color.primaryTextLight().value)
                        .multilineTextAlignment(.leading)
                    Text("(n.)")
                        .fontWeight(.regular)
                        .foregroundColor(DesignSystem.Color.secondaryTextLight().value)
                }
                .padding(.vertical, DesignSystem.Size.small())
                Text(Localisation.wordSalubriousDefinition())
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(DesignSystem.Color.secondaryTextLight().value)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, DesignSystem.Size.xxxLarge())
        .background(DesignSystem.Color.color6().value)
        .cornerRadius(DesignSystem.Size.small())
    }

    var titleLabel: some View {
        Text(Localisation.remindersSettingPageTitle())
            .font(.title3)
            .fontWeight(.regular)
            .foregroundColor(DesignSystem.Color.primaryTextDark().value)
            .multilineTextAlignment(.center)
    }

    /// `startAt` and `endAt` properties displays time with 30 min intervals
    var properties: some View {
        // FIXME: Logic of time date changing on plus and minus
        let timeCountDisplayer: (Int) -> String = { "\($0/2):\($0.isMultiple(of: 2) ? "00" : "30")" }
        let timeCountUpdater: (Int, Int) -> Int = { ($0 + $1) % 48 } // 48 number of half hours in day

        return VStack(spacing: DesignSystem.Size.medium()) {
            ReminderSettingItem(title: Localisation.howMany(), count: 10, countDisplayer: { "\($0)x" }, countUpdater: { max(1, $0 + $1) })
            ReminderSettingItem(title: Localisation.startAt(), count: 15, countDisplayer: timeCountDisplayer, countUpdater: timeCountUpdater)
            ReminderSettingItem(title: Localisation.endAt(), count: 10, countDisplayer: timeCountDisplayer, countUpdater: timeCountUpdater)
        }
        .padding(.horizontal)
    }
}

// MARK: - Previews
struct RemindersSettingView_Previews: PreviewProvider {
    static var previews: some View {
        RemindersSettingView()
    }
}
