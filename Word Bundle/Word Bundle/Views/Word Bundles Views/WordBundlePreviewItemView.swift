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
        .overlay(activeWordBundleId == wordBundle.id ?
                 RoundedRectangle(cornerRadius: DesignSystem.Size.xxLarge())
            .stroke(Color(hex: 0x039be5), lineWidth: 7)
            .opacity(1) :
                    RoundedRectangle(cornerRadius: DesignSystem.Size.xxLarge())
            .stroke(.clear, lineWidth: 5)
            .opacity(0)
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
