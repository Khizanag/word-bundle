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
                WordsView(words: words)
                    .tabItem {
                        Image(systemName: "phone.fill")
                        Text("Calls")
                    }

                ThemesView(themesModel: themesModel)
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("Library")
                    }

                HomeView(wordBundle: .example, words: words, themesModel: themesModel)
                    .tabItem {
                        Image(systemName: "scroll.fill")
                        Text(Localisation.home())
                    }

                WordBundlesView()
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Contact")
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
