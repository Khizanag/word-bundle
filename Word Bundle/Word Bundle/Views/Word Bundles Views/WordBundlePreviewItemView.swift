//
//  WordBundlePreviewItemView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlePreviewItemView: View {
    let wordBundle: WordBundle

    var body: some View {
        ZStack {
            Color(hex: 0x039be5) // TODO: fix this

            HStack (alignment: .center) {
                VStack (alignment: .leading, spacing: 6) {
                    Text(wordBundle.name)
                        .font(.headline)
                        .foregroundColor(.white)

                    if let words = wordBundle.words {
                        Text("\(words.count) Words")
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .padding()

                Spacer()

                wordBundle.icon
                    .frame(width: 36, height: 44, alignment: .center)
                    .padding()
            }
        }
        .frame(height: 96)
        .cornerRadius(DesignSystem.Size.xxLarge())
        .padding(.horizontal, 32)
    }
}

struct WordBundleView_Previews: PreviewProvider {
    static var previews: some View {
        WordBundlePreviewItemView(wordBundle: WordBundle.example2)
    }
}
