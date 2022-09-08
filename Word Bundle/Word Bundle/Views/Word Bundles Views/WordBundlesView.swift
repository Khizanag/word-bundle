//
//  WordBundlesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlesView: View {
    @AppStorage(AppStorageKeys.activeWordBundleId()) var activeWordBundleId: UUID = WordBundle.example.id

    var body: some View {
        VStack(spacing: DesignSystem.Size.xxxLarge()) {
            AddWordBundleItemView()
            ForEach(WordBundle.examples, id: \.id) { wordBundle in
                WordBundlePreviewItemView(wordBundle: wordBundle)
                    .onTapGesture {
                        activeWordBundleId = wordBundle.id
                    }
            }

            Spacer()
        }
    }
}

struct WordBundlesView_Previews: PreviewProvider {
    static var previews: some View {
        WordBundlesView()
    }
}
