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
    @State private var page: Page = .first()
    @State private var words: [Word]
    @State private var isWordDetailViewActive = false
    @State private var isWordBundleDetailViewActive = false
    @State private var activeWord: Word

    // MARK: - Init
    init(wordBundle: WordBundle) {
        self.wordBundle = wordBundle
        let words = wordBundle.words.shuffled()
        self._words = State(initialValue: words)
        self._activeWord = State(initialValue: words[0])
    }

    var body: some View {
        VStack {
            NavigationLink(destination: LibraryView(), isActive: $isWordBundleDetailViewActive) { }
            NavigationLink(destination: WordView(word: $activeWord), isActive: $isWordDetailViewActive) { }
            Pager(page: page, data: wordBundle.words, id: \.id) { word in
                ZStack {
                    Color.gray // TODO: choose color

                    VStack {
                        Text(word.word)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(DesignSystem.Color.primaryTextLight()())
                            .multilineTextAlignment(.center)
                            .padding()

                        Text("(\(word.partOfSpeech.shortTitle).) \(word.definition)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(DesignSystem.Color.secondaryTextLight()())
                            .multilineTextAlignment(.center)
                            .padding()

                        VStack {
                            ForEach(word.examples, id: \.self) { example in
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
                                    activeWord = wordBundle.words[page.index]
                                }
                            case (-100...100, 0...):
                                withAnimation {
                                    page.update(.previous)
                                    activeWord = wordBundle.words[page.index]
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
        HomeView(wordBundle: .example)
    }
}
