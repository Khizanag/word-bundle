//
//  ZerothView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 09.09.22.
//

import SwiftUI

struct ZerothView: View {
    @AppStorage(AppStorageKeys.hasCompletedOnboarding()) private var hasCompletedOnboarding = false

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

struct ZerothView_Previews: PreviewProvider {
    static var previews: some View {
        ZerothView()
    }
}
