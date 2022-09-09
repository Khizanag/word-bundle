//
//  MainView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct MainView: View {
    @AppStorage(AppStorageKeys.chosenThemeId()) private var chosenThemeIndex = Theme.example.id
    @AppStorage(AppStorageKeys.activeWordBundleId()) private var activeWordBundleId = WordBundle.example.id
    @AppStorage(AppStorageKeys.hasCompletedOnboarding()) private var hasCompletedOnboarding = false

    @State var selection: TabItem = .bundles

    var body: some View {
        ZStack {
            let theme = Theme.themes[chosenThemeIndex]
            theme.color
                .opacity(theme.opacity)
                .ignoresSafeArea()

            TabView(selection: $selection) {
                WordBundlesView(selection: $selection)
                    .tabItem {
                        DesignSystem.Image.booksVerticalFill()
                        Text(Localisation.bundles())
                    }
                    .tag(TabItem.bundles)

                ThemesView(themes: Theme.themes)
                    .tabItem {
                        DesignSystem.Image.paintbrushFill()
                        Text(Localisation.themes())
                    }

                HomeView(activeWordBundleId: activeWordBundleId)
                    .tabItem {
                        DesignSystem.Image.scrollFill()
                        Text(Localisation.home())
                    }

                WordBundleView(activeBundleId: activeWordBundleId)
                    .tabItem {
                        DesignSystem.Image.textBookClosedFill()
                        Text(Localisation.words())
                    }
                    .tag(TabItem.words)

                SettingsView()
                    .tabItem {
                        DesignSystem.Image.gearshape2Fill()
                        Text(Localisation.settings())
                    }
            }
        }
        .onAppear {
            hasCompletedOnboarding = true
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
