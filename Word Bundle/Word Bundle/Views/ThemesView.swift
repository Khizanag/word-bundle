//
//  ThemesView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import SwiftUI

struct ThemesView: View {
    @ObservedObject var themesModel: ThemesModel

    var body: some View {
        ZStack {
            themesView
        }
    }

    private var themesView: some View {
        AspectVGrid(items: themesModel.themes, aspectRatio: 2/3) { theme in
            ThemeView(theme: theme)
                .padding(DesignSystem.Size.small())
                .onTapGesture {
                    themesModel.selectTheme(theme: theme)
                }
        }
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView(themesModel: .init())
    }
}
