//
//  WordView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 26.07.22.
//

import SwiftUI

struct WordView: View {
    @Binding var word: Word
    @State private var imageUrl: String = ""
    private let imageRepository: ImageRepository = UnsplashImageRepository()
    
    var body: some View {
        VStack {
            //Color.gray
            Image(uiImage: UIImage.load(url: imageUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button("Fetch Data") {
                Task {
                    imageUrl = await imageRepository.getFullUrl(of: word.word).orEmpty
                }
            }
        }
        .navigationTitle(word.word)
        .ignoresSafeArea()
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: .init(projectedValue: .constant(.basketball)))
    }
}
