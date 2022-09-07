//
//  WordView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 26.07.22.
//

import SwiftUI
import SDWebImageSwiftUI

struct WordView: View {
    @Binding var word: Word

    var body: some View {
        VStack {
            // Color.gray

            // For more properties: https://github.com/SDWebImage/SDWebImageSwiftUI
            AnimatedImage(url: URL(string: word.imageUrl.orEmpty))
                .resizable()
                .indicator(.progress)
                .scaledToFit()
        }
        .navigationTitle(word.word.capitalized)
        .ignoresSafeArea()
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: .init(projectedValue: .constant(.basketball)))
    }
}
