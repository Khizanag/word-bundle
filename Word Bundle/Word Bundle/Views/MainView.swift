//
//  MainView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct MainView: View {
    @AppStorage(AppStorageKeys.chosenThemeId()) var chosenThemeIndex = Theme.example.id
    @AppStorage(AppStorageKeys.activeWordBundleId()) var activeWordBundleId = WordBundle.example.id

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
                        Image(systemName: "books.vertical.fill" )
                        Text("Bundles")
                    }
                    .tag(TabItem.bundles)


                ThemesView(themes: Theme.themes)
                    .tabItem {
                        Image(systemName: "paintbrush.fill")
                        Text("Themes")
                    }

                HomeView(activeWordBundleId: activeWordBundleId)
                    .tabItem {
                        Image(systemName: "scroll.fill")
                        Text(Localisation.home())
                    }

                WordBundleView(activeBundleId: activeWordBundleId)
                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text("Words")
                    }
                    .tag(TabItem.words)

                SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape.2.fill")
                        Text("Settings")
                    }
            }
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
