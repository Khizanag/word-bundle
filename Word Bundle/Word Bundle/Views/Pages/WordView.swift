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
                AnimatedImage(url: URL(string: word.imageUrl.orEmpty))
                    .resizable()
                    .indicator(Indicator.progress(style: .bar))
                    .transition(.fade)
                    .scaledToFit()

                VStack (alignment: .leading) {
                    HStack {
                        Text(word.word.uppercased())
                            .font(.system(size: Size.xxxLarge()))
                            .foregroundColor(Color(hex: 0x3F3F3F))

                        soundSpeakerPlayer
                    }

                    phoneticSubSection

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
            DesignSystem.Image.speaker()
                .foregroundColor(player == nil ? .clear : Color(hex: 0x3F3F3F))
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
                section(phrases: lexicalEntry.phrases)
            }

            senses(for: lexicalEntry)
        }
    }

    // TODO: show phrasal verbs

    private var phoneticSubSection: some View {
        HStack {
            if let phoneticSpelling = word.pronunciation.phoneticSpelling {
                Text(phoneticSpelling)
                    .foregroundColor(Color(hex: 0x3F3F3F))
            }

            if let phoneticNotation = word.pronunciation.phoneticNotation {
                Text("(\(phoneticNotation))")
                    .foregroundColor(Color(hex: 0x3F3F3F))
                    .opacity(0.6)
            }
        }
    }

    private func senses(for lexicalEntry: Word.LexicalEntry) -> some View {
        ForEach (lexicalEntry.entries, id: \.self) { entry in
            ForEach (entry.senses, id: \.self) { sense in
                Divider()
                    .padding(.leading, 50)

                if !sense.definitions.isEmpty {
                    section(definitions: sense.definitions)
                }

                if !sense.shortDefinitions.isEmpty {
                    section(shortDefinitions: sense.shortDefinitions)
                }

                if !sense.examples.isEmpty {
                    section(examples: sense.examples)
                }

                if !sense.synonyms.isEmpty {
                    section(synonyms: sense.synonyms)
                }

                if !sense.antonyms.isEmpty {
                    section(antonyms: sense.antonyms)
                }
            }
        }
    }

    // MARK: - Phrases' Sub Section
    private func section(phrases: [String]) -> some View {
        VStack (alignment: .leading) {
            CollapsibleView(
                label: {
                    subSectionHeader(for: Localisation.phrases())
                },
                content: {
                    ForEach (phrases, id: \.self) { phrase in
                        bulletRow(for: phrase)
                    }
                }
            )
            .padding(.bottom, Size.xSmall())
            .frame(maxWidth: .infinity)
        }
        .padding(.bottom, Size.xSmall())
    }

    // MARK: - Examples
    private func section(examples: [String]) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: Localisation.examples())
            ForEach(examples, id: \.self) { example in
                bulletRow(for: example)
            }
        }
        .padding(.bottom, Size.xSmall())
    }

    // MARK: - Synonyms
    private func section(synonyms: [String]) -> some View {
        VStack (alignment: .leading) {
            CollapsibleView(
                label: {
                    subSectionHeader(for: Localisation.synonyms())
                },
                content: {
                    ForEach(synonyms, id: \.self) { synonym in
                        bulletRow(for: synonym)
                    }
                }
            )
            .padding(.bottom, Size.xSmall())
            .frame(maxWidth: .infinity)
        }
    }

    // MARK: - Antonyms' Sub Section
    private func section(antonyms: [String]) -> some View {
        VStack (alignment: .leading) {
             CollapsibleView(
                 label: {
                     subSectionHeader(for: Localisation.antonyms())
                 },
                 content: {
                     ForEach(antonyms, id: \.self) { antonym in
                         bulletRow(for: antonym)
                     }
                 }
             )
             .frame(maxWidth: .infinity)
        }
        .padding(.bottom, Size.xSmall())
    }

    // MARK: - Definitions
    private func section(definitions: [String]) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: Localisation.definitions())
            ForEach(definitions, id: \.self) { definition in
                bulletRow(for: definition)
            }
        }
        .padding(.bottom, Size.xSmall())
    }

    // MARK: - Short Definitions
    private func section(shortDefinitions: [String]) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: Localisation.shortDefinitions())
            ForEach(shortDefinitions, id: \.self) { shortDefinition in
                bulletRow(for: shortDefinition)
            }
        }
        .padding(.bottom, Size.xSmall())
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
