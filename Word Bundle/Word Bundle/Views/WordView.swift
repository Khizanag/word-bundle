//
//  WordView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 26.07.22.
//

import AVFoundation
import SwiftUI
import SDWebImageSwiftUI

struct WordView: View {
    private typealias Size = DesignSystem.Size

    var word: Word
    @State private var player: AVPlayer?

    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                // For more properties: https://github.com/SDWebImage/SDWebImageSwiftUI
                AnimatedImage(url: URL(string: word.imageUrl.orEmpty))
                    .resizable()
                    .indicator(.progress)
                    .scaledToFit()

                VStack (alignment: .leading) {
                    HStack {
                        Text(word.word.uppercased())
                            .font(.system(size: Size.xxxLarge()))
                            .foregroundColor(Color(hex: 0x3F3F3F))

                        soundSpeakerPlayer
                    }

                    if let phoneticSpelling = word.pronunciation.phoneticSpelling {
                        Text(phoneticSpelling)
                            .foregroundColor(Color(hex: 0x3F3F3F))
                    }

                    sections
                }
                .padding()
            }
        }
        .ignoresSafeArea()
        .navigationBarTitle(word.word.uppercased())
    }

    private var soundSpeakerPlayer: some View {
        Button {
            Task {
                await replay()
            }
        } label: {
            Image(systemName: "speaker.wave.3") // TODO: move to DesignSystem
        }
        .onAppear {
            setupPlayer()
        }
    }

    private var sections: some View {
        ForEach (word.lexicalEntries, id: \.self) { lexicalEntry in
            Divider()

            Text(lexicalEntry.lexicalCategory)
                .font(.system(size: Size.xxLarge()))
                .foregroundColor(Color(hex: 0x3F3F3F))
                .opacity(0.7)
                .padding(.bottom, Size.xSmall())

            if !lexicalEntry.phrases.isEmpty {
                phrases(for: lexicalEntry)
            }

            senses(for: lexicalEntry)
        }
    }

    private func senses(for lexicalEntry: Word.LexicalEntry) -> some View {
        ForEach (lexicalEntry.entries, id: \.self) { entry in
            ForEach (entry.senses, id: \.self) { sense in
                Divider()
                    .padding(.leading, 50)

                if !sense.definitions.isEmpty {
                    definitions(for: sense)
                }

                if !sense.shortDefinitions.isEmpty {
                    shortDefinitions(for: sense)
                }

                if !sense.examples.isEmpty {
                    examples(for: sense)
                }

                if !sense.synonyms.isEmpty {
                    synonyms(for: sense)
                }

                if !sense.antonyms.isEmpty {
                    antonyms(for: sense)
                }
            }
        }
    }

    // MARK: - Phrases' Sub Section
    private func phrases(for lexicalEntry: Word.LexicalEntry) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Phrases") // TODO: Localization
            phrasesRows(for: lexicalEntry)
        }
        .padding(.bottom, Size.xSmall())
    }

    private func phrasesRows(for lexicalEntry: Word.LexicalEntry) -> some View {
        ForEach (lexicalEntry.phrases, id: \.self) { phrase in
            bulletRow(for: phrase)
        }
    }

    // MARK: - Examples' Sub Section
    private func examples(for sense: Word.Sense) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Examples") // TODO: Localization
            examplesRows(for: sense)
        }
        .padding(.bottom, Size.xSmall())
    }

    private func examplesRows(for sense: Word.Sense) -> some View {
        ForEach(sense.examples, id: \.self) { example in
            bulletRow(for: example)
        }
    }

    // MARK: - Synonyms' Sub Section
    private func synonyms(for sense: Word.Sense) -> some View {
        VStack (alignment: .leading) {
            CollapsibleView(
                label: {
                    subSectionHeader(for: "Synonyms") // TODO: Localization
                },
                content: {
                    synonymsRows(for: sense)
                }
            )
            .padding(.bottom, Size.xSmall())
            .frame(maxWidth: .infinity)
        }
    }

    private func synonymsRows(for sense: Word.Sense) -> some View {
        ForEach(sense.synonyms, id: \.self) { synonym in
            bulletRow(for: synonym)
        }
    }

    // MARK: - Antonyms' Sub Section
    private func antonyms(for sense: Word.Sense) -> some View {
        VStack (alignment: .leading) {
             CollapsibleView(
                 label: {
                     subSectionHeader(for: "Antonyms") // TODO: Localization
                 },
                 content: {
                     antonymsRows(for: sense)
                 }
             )
             .frame(maxWidth: .infinity)
        }
        .padding(.bottom, Size.xSmall())
    }

    private func antonymsRows(for sense: Word.Sense) -> some View {
        ForEach(sense.antonyms, id: \.self) { antonym in
            bulletRow(for: antonym)
        }
    }

    // MARK: - Definitions' Sub Section
    private func definitions(for sense: Word.Sense) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Definitions") // TODO: Localization
            definitionsRows(for: sense)
        }
        .padding(.bottom, Size.xSmall())
    }

    private func definitionsRows(for sense: Word.Sense) -> some View {
        ForEach(sense.definitions, id: \.self) { definition in
            bulletRow(for: definition)
        }
    }

    // MARK: - Short Definitions' Sub Section
    private func shortDefinitions(for sense: Word.Sense) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Short Definitions") // TODO: Localization
            definitionsRows(for: sense)
        }
        .padding(.bottom, Size.xSmall())
    }

    private func shortDefinitionsRows(for sense: Word.Sense) -> some View {
        ForEach(sense.shortDefinitions, id: \.self) { shortDefinition in
            bulletRow(for: shortDefinition)
        }
    }

    // MARK: - Helpers
    private func bulletRow(for text: String) -> some View {
        HStack {
            Text("\u{2022} " + text.capitalized)
                .foregroundColor(Color(hex: 0x3F3F3F))
                .padding(.leading)
            Spacer()
        }
    }

    private func subSectionHeader(for title: String) -> Text {
        Text(title)
            .font(.system(size: Size.xLarge()))
            .bold()
            .foregroundColor(Color(hex: 0x3F3F3F))
    }

    private func setupPlayer() {
        guard let audioFile = word.pronunciation.audioFile,
              let url = URL(string: audioFile) else { return }

        let playerItem = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: playerItem)
    }

    private func replay() async {
        await player?.seek(to: .zero)
        await player?.play()
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: .basketball)
    }
}
