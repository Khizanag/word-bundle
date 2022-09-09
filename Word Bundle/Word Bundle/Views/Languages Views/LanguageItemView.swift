//
//  LanguageItemView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 09.09.22.
//

import SwiftUI

struct LanguageItemView: View {
    var language = Language.english
    @Binding var chosenLanguage: Language

    var body: some View {
        HStack (alignment: .center) {
            language.image
                .resizable()
                .foregroundColor(.black)
                .frame(width: 44, height: 30)
                .cornerRadius(30)
                .font(.headline)
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .padding(.leading)

            Text(language.name)
                .foregroundColor(Color(hex: 0x3F3F3F))
                .padding(.leading, DesignSystem.Size.xLarge())

            Spacer()

            if chosenLanguage == language {
                Image(systemName: "checkmark.square.fill") // TODO: move to DesignSystem
                    .font(.title3)
                    .foregroundColor(Color(hex: 0x039be5))
                    .padding(.trailing)
            }
        }
        .frame(height: 36)
        .padding()
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageItemView(chosenLanguage: .init(projectedValue: .constant(.english)))
    }
}
