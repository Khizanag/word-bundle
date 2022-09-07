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

    @State private var textFieldText = ""
    @State private var isTextFieldDisabled = false
    @State private var isButtonLoading = false

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: WordEntity.entity(), sortDescriptors: [])
    private var entities: FetchedResults<WordEntity>

    var body: some View {
        VStack {
            TextField("Type word to search here", text: $textFieldText)
                .disabled(isTextFieldDisabled)
                .padding()

            enterButton
                .frame(maxWidth: .infinity)
                .background(DesignSystem.Color.color3().value) // FIXME: try to remove
                .cornerRadius(DesignSystem.Size.small())
                .padding()

            List {
                ForEach(entities) { entity in
                    if let word = Word.make(from: entity) {
                        NavigationLink(destination: WordView(word: word)) {
                            Image(systemName: "wand.and.stars")
                            Text(word.word.capitalized)
                        }
                    }
                }
                .onDelete(perform: deleteRow)
            }
        }
        .navigationTitle("Words")
    }

    private func reset() {
        textFieldText = ""
        isTextFieldDisabled = false
        isButtonLoading = false
    }

    private var enterButton: some View {
        LoadingButton(
            action: {
                addWord()
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

    // MARK: - Functions
    private func deleteRow(at indexSet: IndexSet) {
//         words.remove(atOffsets: indexSet)
        // TODO: implement
    }

    private func addWord() {
        isTextFieldDisabled = true
        isButtonLoading = true

        Task {
            defer {
                Task { @MainActor in // FIXME: WTF?
                    reset()
                }
            }

            guard var word = await dictionariesRepository.entries(of: textFieldText, language: .english),
                  let audioFile = word.pronunciation.audioFile,
                  let url = URL(string: audioFile) else { return }

            word.imageUrl = await imageRepository.getFullUrl(of: textFieldText)

//            words.append(word)

            do {
                let wordEntity = WordEntity(context: viewContext)
                let encodedWord = try JSONEncoder().encode(word)
                wordEntity.encodedWord = encodedWord

                withAnimation {
                    saveContext()
                }
            } catch {
                fatalError("An error occured during encoding word")
            }

            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
        }
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}

struct WordsView_Previews: PreviewProvider {
    static var previews: some View {
        WordsView()
    }
}
