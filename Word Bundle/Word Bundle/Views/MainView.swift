//
//  MainView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct MainView: View {
    @AppStorage(AppStorageKeys.chosenThemeId()) var chosenThemeIndex = Theme.example.id

    var body: some View {
        ZStack {
            Theme.themes[chosenThemeIndex].color
                .ignoresSafeArea()

            TabView {
                WordBundlesView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill" )
                        Text("Bundles")
                    }

                ThemesView(themes: Theme.themes)
                    .tabItem {
                        Image(systemName: "paintbrush.fill")
                        Text("Themes")
                    }

                HomeView(wordBundle: .example)
                    .tabItem {
                        Image(systemName: "scroll.fill")
                        Text(Localisation.home())
                    }

                WordsView()
                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text("Words")
                    }

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
