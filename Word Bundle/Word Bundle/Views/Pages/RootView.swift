//
//  RootView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 09.09.22.
//

import SwiftUI

struct RootView: View {
    // MARK: - Properties
    @AppStorage(AppStorageKeys.hasCompletedOnboarding()) private var hasCompletedOnboarding = false

    // MARK: - Body
    var body: some View {
        NavigationView {
            if hasCompletedOnboarding {
                MainView()
            } else {
                WelcomeView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
