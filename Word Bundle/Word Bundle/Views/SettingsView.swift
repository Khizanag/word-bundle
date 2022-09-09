//
//  SettingsView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 03.09.22.
//

import SwiftUI

struct SettingsView: View {
    @State var words: [Word] = []
    var body: some View {
        List {
            NavigationLink(destination: RemindersSettingView()) {
                Image(systemName: "bell.badge") // TODO: move to DesignSystem
                Text(Localisation.reminderSettings())
            }

            NavigationLink(destination: ThemesView(themes: Theme.themes)) {
                Image(systemName: "paintbrush") // TODO: move to DesignSystem
                Text(Localisation.changeBackgroundTheme())
            }
        }
        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
