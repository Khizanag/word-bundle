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
        ScrollView {
            VStack {
                exampleWordComponentView
                    .padding(.top, DesignSystem.Size.xLarge())

                titleLabel
                    .padding(.top, 64)

                properties
                    .padding(DesignSystem.Size.xxSmall())

                NavigationButton(title: Localisation.getStarted(), destination: MainView())
                    .padding()
            }
        }
        .navigationTitle(Localisation.reminders())
    }

    private var exampleWordComponentView: some View {
        HStack {
            // FIXME: icon should be lefter
            DesignSystem.Image.bell()
                .padding()

            VStack(alignment: .leading) {
                HStack {
                    Text(Localisation.wordSalubrious())
                        .fontWeight(.bold)
                        .foregroundColor(DesignSystem.Color.primaryTextLight())
                        .multilineTextAlignment(.leading)

                    Text("(n.)")
                        .fontWeight(.regular)
                        .foregroundColor(DesignSystem.Color.secondaryTextLight())
                }
                .padding(.vertical, DesignSystem.Size.xSmall())

                Text(Localisation.wordSalubriousDefinition())
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(DesignSystem.Color.secondaryTextLight())
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.vertical)
        .padding(.horizontal, DesignSystem.Size.xxLarge())
        .background(DesignSystem.Color.color6())
        .cornerRadius(DesignSystem.Size.xSmall())
    }

    private var titleLabel: some View {
        Text(Localisation.remindersSettingPageTitle())
            .font(.subheadline)
            .fontWeight(.regular)
            .foregroundColor(DesignSystem.Color.primaryTextDark())
            .multilineTextAlignment(.center)
    }

    private var properties: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        let fromDate = dateFormatter.date(from: "10:00") ?? .now
        let toDate = dateFormatter.date(from: "20:00") ?? .now

        let numMinutesPerStep = 30

        let dateDisplayer: (Date) -> String = { dateFormatter.string(from: $0) }
        let dateUpdater: (Date, Int) -> Date = { $0.addingTimeInterval(.init($1 * 60 * numMinutesPerStep)) }

        return VStack(spacing: DesignSystem.Size.small()) {
            ReminderSettingItem(title: Localisation.howMany(), value: 10, valueDisplayer: { "\($0)x" }, valueUpdater: { max(1, $0 + $1) })
            ReminderSettingItem(title: Localisation.startAt(), value: fromDate, valueDisplayer: dateDisplayer, valueUpdater: dateUpdater)
            ReminderSettingItem(title: Localisation.endAt(), value: toDate, valueDisplayer: dateDisplayer, valueUpdater: dateUpdater)
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
