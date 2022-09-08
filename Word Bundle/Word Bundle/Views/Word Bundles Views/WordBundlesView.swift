//
//  WordBundlesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlesView: View {
    @Binding var selection : TabItem
    
    var body: some View {
        VStack(spacing: 32) {
            AddWordBundleItemView()
            ForEach(WordBundle.examples.indices, id: \.self) { index in
                WordBundlePreviewItemView(wordBundle: WordBundle.examples[index])
                    .onTapGesture {
                        selection = .words
                    }
            }

            Spacer()
        }
    }
}

struct WordBundlesView_Previews: PreviewProvider {
    static var previews: some View {
        WordBundlesView(selection: .init(projectedValue: .constant(.words)))
    }
}
