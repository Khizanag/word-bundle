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
                    .navigationViewStyle(.stack)

                    .tabItem {
                        Image(systemName: "books.vertical.fill" )
                        Text("Bundles")
                    }
                    .tag(TabItem.bundles)

                ThemesView(themes: Theme.themes)
                    .navigationViewStyle(.stack)

                    .tabItem {
                        Image(systemName: "paintbrush.fill")
                        Text("Themes")
                    }

                HomeView(activeWordBundleId: activeWordBundleId)
                    .navigationViewStyle(.stack)

                    .tabItem {
                        Image(systemName: "scroll.fill")
                        Text(Localisation.home())
                    }

                WordBundleView(activeBundleId: activeWordBundleId)
                    .navigationViewStyle(.stack)

                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text("Words")
                    }
                    .tag(TabItem.words)

                SettingsView()
                    .navigationViewStyle(.stack)

                    .tabItem {
                        Image(systemName: "gearshape.2.fill")
                        Text("Settings")
                    }
            }
        }
        .onAppear {
            hasCompletedOnboarding = true
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
