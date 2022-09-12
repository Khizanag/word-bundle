//
//  HomeView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import SwiftUI
import SwiftUIPager

struct HomeView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext

    @AppStorage(AppStorageKeys.chosenThemeId()) private var chosenThemeId = Theme.example.id
    @AppStorage(AppStorageKeys.activeWordBundleId()) private var activeWordBundleId = WordBundle.example.id

    @FetchRequest private var fetchedEntities: FetchedResults<WordEntity>

    @State private var page: Page = .first()
    @State private var isWordDetailViewActive = false
    @State private var isWordBundleDetailViewActive = false
    @State private var isButtonShown = true

    // MARK: - Init
    init(activeWordBundleId: UUID) {
        _fetchedEntities = FetchRequest<WordEntity>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "bundleId == %@", activeWordBundleId as CVarArg), // TODO: change with K
            animation: .default // TODO: try others too
        )
    }

    // MARK: - Body
    var body: some View {
        ZStack {
            Theme.theme(id: chosenThemeId).getColor()

            Pager(page: page, data: fetchedEntities, id: \.id) { entity in
                if let word = Word.make(from: entity) {
                    ZStack {
                        Color.clear // for increasing tappable area

                        VStack {
                            if let wordForView = Word.make(from: fetchedEntities[page.index]) {
                                NavigationLink(destination: WordView(word: wordForView), isActive: $isWordDetailViewActive) { }
                            }

                            title(of: word)

                            lexicalCategory(of: word)

                            examples(of: word)
                        }
                    }
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                            .onEnded { value in
                                withAnimation {
                                    handleDragGesture(value: value)
                                }
                            }
                    )
                }
            }
            .sensitivity(.low)
            .vertical()
        }
        .ignoresSafeArea()
    }

    // MARK: - Private
    private func title(of word: Word) -> some View {
        Text(word.word)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(DesignSystem.Color.primaryTextLight())
            .multilineTextAlignment(.center)
            .padding()
    }

    private func lexicalCategory(of word: Word) -> some View {
        let lexicalCategory = word.lexicalEntries.first?.lexicalCategory ?? ""
        return Text("(\(lexicalCategory)) \(word.exampleDefinition)")// FIXME: second part
            .font(.headline)
            .fontWeight(.bold)
            .foregroundColor(DesignSystem.Color.secondaryTextLight())
            .multilineTextAlignment(.center)
            .padding()
    }

    private func examples(of word: Word) -> some View {
        VStack {
            let examples = word.lexicalEntries.first?.entries.first?.senses.first?.examples ?? [Localisation.examplesNotFound()]
            ForEach(examples, id: \.self) { example in
                Text(example)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(DesignSystem.Color.secondaryTextLight())
                    .multilineTextAlignment(.center)
                    .padding(.top, DesignSystem.Size.min())
            }
        }
        .padding(.top, DesignSystem.Size.xxLarge())
    }

    private func handleDragGesture(value: DragGesture.Value) {
        switch(value.translation.width, value.translation.height) {
        case (...0, -50...50):
            isWordDetailViewActive = true
        case (0..., -50...50):
            isWordBundleDetailViewActive = true
        case (-100...100, ...0):
                page.update(.next)
        case (-100...100, 0...):
                page.update(.previous)
        default: break
        }
    }
}

// MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(activeWordBundleId: WordBundle.example.id)
    }
}
