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
    private var wordBundle: WordBundle
    @ObservedObject private var themesModel: ThemesModel
    @State private var page: Page = .first()
    private var words: [Word]
    @State private var isWordDetailViewActive = false
    @State private var isWordBundleDetailViewActive = false
    @State private var activeWord: Word

    @State private var isButtonShown = true

    // MARK: - Init
    init(wordBundle: WordBundle, words: [Word], themesModel: ThemesModel) {
        self.wordBundle = wordBundle // TODO: undo
        self.words = words
        self._activeWord = State(initialValue: words[0])
        self.themesModel = themesModel
    }

    var body: some View {
        VStack {
            NavigationLink(destination: WordView(word: $activeWord), isActive: $isWordDetailViewActive) { }
            Pager(page: page, data: words, id: \.id) { word in
                ZStack {
                    themesModel.getSelectedTheme()?.color
                    VStack {
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
                                    activeWord = words[page.index]
                                }
                            case (-100...100, 0...):
                                withAnimation {
                                    page.update(.previous)
                                    activeWord = words[page.index]
                                }
                            default: break
                            }
                        }
                )
            }
            .sensitivity(.low)
            .vertical()
            .ignoresSafeArea()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(wordBundle: .example, words: [], themesModel: .init())
    }
}
