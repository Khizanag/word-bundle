//
//  Word_BundleApp.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 23.04.22.
//

import SwiftUI

@main
// swiftlint:disable type_name
struct Word_BundleApp: App {
// swiftlint:enable type_name
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
