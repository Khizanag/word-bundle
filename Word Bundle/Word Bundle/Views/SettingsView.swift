//
//  SettingsView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 03.09.22.
//

import SwiftUI

struct SettingsView: View {
    // TODO: find and fix navigation title bug
    var body: some View {
        List {
            NavigationLink(destination: Text("Reminder Settings")) { // TODO: change destination
                Image(systemName: "bell.badge")
                Text("Reminder Settings")
            }
//            .padding() // TODO: discuss needed or not

            NavigationLink(destination: Text("Change Background Theme")) { // TODO: change destination
                Image(systemName: "paintbrush")
                Text("Change Background Theme")
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
