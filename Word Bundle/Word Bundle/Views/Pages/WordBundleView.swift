//
//  WordsView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 06.09.22.
//

import AVFoundation
import SwiftUI

struct WordBundleView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext

    @AppStorage(AppStorageKeys.activeWordBundleId()) var activeWordBundleId = WordBundle.example.id

    @FetchRequest private var fetchedEntities: FetchedResults<WordEntity>
    @FetchRequest private var wordBundleEntities: FetchedResults<WordBundleEntity>

    @State private var textFieldText = ""
    @State private var isButtonLoading = false

    private let dictionariesRepository: DictionariesRepository = OxfordDictionariesRepository()
    private let imageRepository: ImageRepository = UnsplashImageRepository()

    // MARK: - Init
    init(activeBundleId: UUID) {
        _fetchedEntities = FetchRequest<WordEntity>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "bundleId == %@", activeBundleId as CVarArg), // TODO: change with K
            animation: .default // TODO: try others too
        )

        _wordBundleEntities = FetchRequest<WordBundleEntity>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "id == %@", activeBundleId as CVarArg) // TODO: change with K
        )
    }

    var body: some View {
        VStack {
            HStack {
                Text(wordBundleEntities.first?.name ?? Localisation.wordBundle())
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .bottom])

                Spacer()
            }

            TextField(Localisation.textFieldMessage(), text: $textFieldText)
                .disabled(isButtonLoading)
                .padding()
                .onSubmit {
                    addWord()
                }

            enterButton
                .disabled(textFieldText.isEmpty)
                .frame(maxWidth: .infinity)
                .background(DesignSystem.Color.color3().value)
                .cornerRadius(DesignSystem.Size.small())
                .padding()

            List {
                ForEach(fetchedEntities) { entity in
                    if let word = Word.make(from: entity) {
                        NavigationLink(destination: WordView(word: word)) {
                            DesignSystem.Image.textJustifyLeft()
                            Text(word.word.capitalized)
                        }
                    }
                }
                .onDelete(perform: deleteWords)
            }
        }
    }

    private func reset() {
        textFieldText = ""
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
                Text(Localisation.addWord())
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
        isButtonLoading = true

        Task {
            defer {
                Task { @MainActor in // FIXME: WTF?
                    reset()
                }
            }

            guard let language = wordBundleEntities.first?.language,
                  var word = await dictionariesRepository.entries(of: textFieldText, language: language, wordBundleId: activeWordBundleId) else { return }

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
