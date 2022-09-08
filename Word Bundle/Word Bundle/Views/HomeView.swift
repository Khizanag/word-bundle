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
    @AppStorage(AppStorageKeys.chosenThemeId()) var chosenThemeId = Theme.example.id

    @State private var page: Page = .first()
    @State private var isWordDetailViewActive = false
    @State private var isWordBundleDetailViewActive = false
    @State private var isButtonShown = true

    private var wordBundle: WordBundle

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: WordEntity.entity(), sortDescriptors: [])
    private var entities: FetchedResults<WordEntity>

    // MARK: - Init
    init(wordBundle: WordBundle, words: [Word] = [.basketball]) {
        self.wordBundle = wordBundle
    }

    var body: some View {
        VStack {
            Pager(page: page, data: entities, id: \.id) { entity in
                if let word = Word.make(from: entity) {
                    ZStack {
                        let theme = Theme.theme(id: chosenThemeId)
                        theme.color
                            .opacity(theme.opacity)

                        VStack {
                            if let wordForView = Word.make(from: entities[page.index]) {
                                NavigationLink(destination: WordView(word: wordForView), isActive: $isWordDetailViewActive) { }
                            }

                            Text(word.word)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(DesignSystem.Color.primaryTextLight()())
                                .multilineTextAlignment(.center)
                                .padding()

                            let lexicalCategory = word.lexicalEntries.first?.lexicalCategory ?? ""
                            let definition = word.lexicalEntries.first?.entries.first?.senses.first?.definitions.first ?? ""
                            Text("(\(lexicalCategory)) \(definition)")// FIXME: second part
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(DesignSystem.Color.secondaryTextLight()())
                                .multilineTextAlignment(.center)
                                .padding()

                            VStack {
                                let examples = word.lexicalEntries.first?.entries.first?.senses.first?.examples ?? ["No Example..."]
                                ForEach(examples, id: \.self) { example in
                                    Text(example)
                                        .font(.footnote)
                                        .fontWeight(.light)
                                        .foregroundColor(DesignSystem.Color.secondaryTextLight()())
                                        .multilineTextAlignment(.center)
                                        .padding(.top, DesignSystem.Size.xxxSmall())
                                }
                            }
                            .padding(.top, DesignSystem.Size.xxxLarge())
                        }
                        .padding()
                    }
                    .gesture(
                        DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                            .onEnded { value in
                                print(value.translation)
                                switch(value.translation.width, value.translation.height) {
                                case (...0, -50...50):
                                    isWordDetailViewActive = true
                                case (0..., -50...50):
                                    isWordBundleDetailViewActive = true
                                case (-100...100, ...0):
                                    withAnimation {
                                        page.update(.next)
                                    }
                                case (-100...100, 0...):
                                    withAnimation {
                                        page.update(.previous)
                                    }
                                default: break
                                }
                            }
                    )
                }
            }
            .sensitivity(.low)
            .vertical()
            .ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(wordBundle: .example, words: [])
    }
}
