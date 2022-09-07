//
//  WordBundlesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlesView: View {
    var body: some View {
        VStack(spacing: 32) {
            ForEach(WordBundle.examples.indices, id: \.self) { index in
                WordBundlePreviewItemView(wordBundle: WordBundle.examples[index])
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

