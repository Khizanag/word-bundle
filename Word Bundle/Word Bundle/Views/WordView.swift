//
//  WordView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 26.07.22.
//

import SwiftUI

struct WordView: View {
    @Binding var word: Word

    var body: some View {
        VStack {
            // Color.gray
            
            Image(uiImage: UIImage.load(url: word.imageUrl.orEmpty)) // TODO: do caching
                .resizable()
                .aspectRatio(contentMode: .fit)
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
