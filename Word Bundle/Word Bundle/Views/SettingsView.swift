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
        NavigationView {
            List {
                NavigationLink(destination: Text("Reminder Settings")) { // TODO: change destination
                    Image(systemName: "bell.badge")
                    Text("Reminder Settings")
                }
                .padding()

                NavigationLink(destination: Text("Change Backgound Theme")) { // TODO: change destination
                    Image(systemName: "paintbrush")
                    Text("Change Backgound Theme")
                }
                .padding()
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
