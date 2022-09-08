//
//  SettingsView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 03.09.22.
//

import SwiftUI

struct SettingsView: View {
    // TODO: find and fix navigation title bug
    @State var words: [Word] = []
    var body: some View {
        List {
            NavigationLink(destination: RemindersSettingView(words: words)) {
                Image(systemName: "bell.badge")
                Text("Reminder Settings")
            }
//            .padding() // TODO: discuss needed or not

            NavigationLink(destination: ThemesView(themes: Theme.themes)) {
                Image(systemName: "paintbrush")
                Text("Change Background Theme") // TODO: localization
            }
//            .padding() // TODO: discuss needed or not
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
