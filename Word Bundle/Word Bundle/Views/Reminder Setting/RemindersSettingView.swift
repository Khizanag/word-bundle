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
        VStack {
            Spacer()
            exampleWordComponentView
            Spacer()
            titleLabel
            properties
            Spacer()
            NavigationButton(buttonTitle: Localisation.getStarted(), destination: MainView())
            Spacer()
        }
        .navigationTitle(Localisation.reminders())
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

    var properties: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        let numMinutesPerStep = 30
        let dateDisplayer: (Date) -> String = { dateFormatter.string(from: $0) }
        let dateUpdater: (Date, Int) -> Date = { $0.addingTimeInterval(TimeInterval(60 * numMinutesPerStep * $1)) }

        let initialFromDate = dateFormatter.date(from: "10:00")!
        let initialToDate = dateFormatter.date(from: "20:00")!

        return VStack(spacing: DesignSystem.Size.medium()) {
            ReminderSettingItem(title: Localisation.howMany(), value: 10, valueDisplayer: { "\($0)x" }, valueUpdater: { max(1, $0 + $1) })
            ReminderSettingItem(title: Localisation.startAt(), value: initialFromDate, valueDisplayer: dateDisplayer, valueUpdater: dateUpdater)
            ReminderSettingItem(title: Localisation.endAt(), value: initialToDate, valueDisplayer: dateDisplayer, valueUpdater: dateUpdater)
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
