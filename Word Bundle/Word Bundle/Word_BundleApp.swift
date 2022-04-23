//
//  Word_BundleApp.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 23.04.22.
//

import SwiftUI

@main
struct Word_BundleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
