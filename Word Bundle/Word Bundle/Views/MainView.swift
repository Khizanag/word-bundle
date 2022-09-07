//
//  MainView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var themesModel = ThemesModel()

    let words: [Word] = [.basketball]

    var body: some View {
        ZStack {
            themesModel.getSelectedTheme()?.color
                .ignoresSafeArea()

            TabView {
                WordBundlesView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill" )
                        Text("Bundles")
                    }
                

                ThemesView(themesModel: themesModel)
                    .tabItem {
                        Image(systemName: "paintbrush.fill")
                        Text("Themes")
                    }

                HomeView(wordBundle: .example, words: words, themesModel: themesModel)
                    .tabItem {
                        Image(systemName: "scroll.fill")
                        Text(Localisation.home())
                    }

                WordsView(words: words)
                    .tabItem {
                        Image(systemName: "text.book.closed.fill")
                        Text("Words")
                    }

                SettingsView(words: words)
                    .tabItem {
                        Image(systemName: "brain.head.profile")
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
