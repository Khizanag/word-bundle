//
//  WordsView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 06.09.22.
//

import AVFoundation
import SwiftUI

struct WordBundleView: View {
    @AppStorage(AppStorageKeys.activeWordBundleId()) var activeWordBundleId = WordBundle.example.id

    private let dictionariesRepository: DictionariesRepository = OxfordDictionariesRepository()
    private let imageRepository: ImageRepository = UnsplashImageRepository()

    @State private var textFieldText = ""
    @State private var isTextFieldDisabled = false
    @State private var isButtonLoading = false

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest private var fetchedEntities: FetchedResults<WordEntity>

    // MARK: - Init
    init(activeBundleId: UUID) {
        _fetchedEntities = FetchRequest<WordEntity>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "bundleId == %@", activeBundleId as CVarArg),
            animation: .default // TODO: try others too
        )
    }

    private func refresh() {
        // TODO: update fetchedEntities
    }

    var body: some View {
        VStack {
            TextField("Type word to search here", text: $textFieldText) // TODO: Localization
                .disabled(isTextFieldDisabled)
                .padding()
                .onSubmit {
                    addWord()
                }

            enterButton
                .frame(maxWidth: .infinity)
                .background(DesignSystem.Color.color3().value) // FIXME: try to remove
                .cornerRadius(DesignSystem.Size.small())
                .padding()

            List {
                ForEach(fetchedEntities) { entity in
                    if let word = Word.make(from: entity) {
                        NavigationLink(destination: WordView(word: word)) {
                            Image(systemName: "text.justify.left") // TODO: move to DesignSystem
                            Text(word.word.capitalized)
                        }
                    }
                }
                .onDelete(perform: deleteWords)
            }
        }
        .navigationTitle("Words") // TODO: Localization
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
            style: .init(backgroundColor: DesignSystem.Color.color3().value),
            builder: {
                Text("Add word to Dictionary") // TODO: Localization
                    .foregroundColor(.white)
            }
        )
    }

    // MARK: - Private functions
    private func deleteWords(at indexSet: IndexSet) {
        indexSet.forEach { index in
            viewContext.delete(fetchedEntities[index])
        }

        withAnimation {
            saveContext()
        }
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

            guard var word = await dictionariesRepository.entries(of: textFieldText, language: .english, wordBundleId: activeWordBundleId) else { return }

            word.imageUrl = await imageRepository.getFullUrl(of: textFieldText)

            do {
                let wordEntity = WordEntity(context: viewContext)

                wordEntity.id = word.id
                wordEntity.bundleId = activeWordBundleId
                wordEntity.encodedWord = try JSONEncoder().encode(word)

                withAnimation {
                    saveContext()
                }
            } catch {
                fatalError("An error occured during encoding word")
            }
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
        WordBundleView(activeBundleId: WordBundle.example.id)
    }
}
