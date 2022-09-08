//
//  ThemeView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 12.08.22.
//

import SwiftUI

struct ThemeView: View {
    private typealias Size = DesignSystem.Size

    let theme: Theme
//    @State var isSelected: Bool // FIXME: using isSelected and without chosenThemeId binding
    @Binding var chosenThemeId: Int

    var body: some View {
        ZStack {
            let rect = RoundedRectangle(cornerRadius: Size.medium())
            if theme.isEmpty {
                rect.stroke(.black)
                VStack {
                    Spacer()
                    Text("+ New Theme") // TODO: Localization
                        .font(.system(size: Size.large()))
                        .padding(Size.xSmall())
                }
            } else {
                rect.fill(theme.color)
                if chosenThemeId == theme.id {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "checkmark") // TODO: add to constants
                                .padding(Size.xSmall())
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}
