//
//  WordBundleApp.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 23.04.22.
//

import SwiftUI

@main
struct WordBundleApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
