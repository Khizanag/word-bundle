//
//  WordBundlePreviewItemView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlePreviewItemView: View {
    let wordBundle: WordBundle
    @Binding var activeWordBundleId: UUID

    var body: some View {
        ZStack {
            Color(hex: 0x039be5)
                .opacity(activeWordBundleId == wordBundle.id ? 0.8 : 0.6)

            HStack (alignment: .center) {
                VStack (alignment: .leading, spacing: 6) {
                    Text(wordBundle.name)
                        .font(.headline)
                        .foregroundColor(.white)

//                    TODO: count number of words using other way
//                    if let words = wordBundle.words {
//                        Text("\(words.count) Words")
//                            .font(.subheadline)
//                            .bold()
//                            .foregroundColor(.white)
//                    }
                }
                .padding()

                Spacer()

                wordBundle.language.image
                    .resizable()
                    .frame(width: 44, height: 30)
                    .cornerRadius(30)
                    .font(.headline)
                    .padding()
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.Size.xxLarge())
                    .stroke(Color(hex: 0x039be5), lineWidth: 7)
                    .opacity(activeWordBundleId == wordBundle.id ? 1 : 0)
        )
        .frame(height: 96)
        .cornerRadius(DesignSystem.Size.xxLarge())
        .padding(.horizontal, 32)
    }
}

struct WordBundleView_Previews: PreviewProvider {
    static var previews: some View {
        WordBundlePreviewItemView(wordBundle: WordBundle.example2, activeWordBundleId: .init(projectedValue: .constant(UUID())))
    }
}
