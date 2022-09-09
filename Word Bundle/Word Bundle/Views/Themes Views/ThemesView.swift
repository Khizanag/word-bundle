//
//  ThemesView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import SwiftUI

struct ThemesView: View {
    @AppStorage(AppStorageKeys.chosenThemeId()) var chosenThemeId = Theme.example.id

    @State var themes: [Theme]

    var body: some View {
        AspectVGrid(items: themes, aspectRatio: 2/3) { theme in
            ThemeView(theme: theme, chosenThemeId: $chosenThemeId)
                .padding(DesignSystem.Size.small())
                .onTapGesture {
                    withAnimation {
                        chosenThemeId = theme.id
                    }
                }
        }
        .navigationTitle("Themes")
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView(themes: Theme.themes)
    }
}
