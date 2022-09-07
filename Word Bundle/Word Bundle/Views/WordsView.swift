//
//  WordsView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 06.09.22.
//

import AVFoundation
import SwiftUI

struct WordsView: View {
    private let dictionariesRepository: DictionariesRepository = OxfordDictionariesRepository()
    private let imageRepository: ImageRepository = UnsplashImageRepository()
    @State private var player: AVPlayer?
    @State var words: [Word]
    @State private var textFieldText = ""
    @State private var isTextFieldDisabled = false
    @State private var isButtonLoading = false
    
    var body: some View {
        VStack {
            TextField("Type word to search here", text: $textFieldText)
                .disabled(isTextFieldDisabled)
                .padding()

            enterButton
                .frame(maxWidth: .infinity)
                .background(DesignSystem.Color.color3().value) // FIXME: try to remove
                .cornerRadius(8)
                .padding()
            
                List {
                    ForEach(0..<words.count, id: \.self) { index in
                        NavigationLink(destination: WordView(word: $words[index])) {
                            Image(systemName: "wand.and.stars")
                            Text(words[index].word.capitalized)
                        }
                    }
                }
        }
        .navigationTitle("Words")
    }
    
    private var enterButton: some View {
        LoadingButton(
            action: {
                isTextFieldDisabled = true
                isButtonLoading = true

                Task {
                    defer {
                        textFieldText = ""
                        isTextFieldDisabled = false
                        isButtonLoading = false
                    }

                    guard let response = await dictionariesRepository.entries(of: textFieldText, language: .english) else { return }

                    print(response)
                    let imageUrl = await imageRepository.getFullUrl(of: textFieldText).orEmpty
                    guard let word = Word.make(from: response, url: imageUrl),
                          let audioFile = word.pronunciation.audioFile,
                          let url = URL(string: audioFile) else { return }

                    self.words.append(word)

                    let playerItem = AVPlayerItem(url: url)
                    player = AVPlayer(playerItem: playerItem)
                }
            },
            isLoading: $isButtonLoading,
            style: .init(
                width: 300,
                height: 50,
                cornerRadius: 8,
                backgroundColor: DesignSystem.Color.color3().value,
                loadingColor: .clear,
                strokeWidth: 3,
                strokeColor: .indigo
            ),
            builder: { // TODO: redesign
                Text("Add word to Dictionary")
                    .foregroundColor(.white)
            }
        )
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView(words: [.basketball])
    }
}

