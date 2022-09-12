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
    // MARK: - Properties
    private typealias Size = DesignSystem.Size

    @State private var player: AVPlayer?

    var word: Word

    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                image
                VStack (alignment: .leading) {
                    HStack {
                        title
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

    private var image: some View {
        AnimatedImage(url: URL(string: word.imageUrl.orEmpty))
            .resizable()
            .indicator(Indicator.progress(style: .bar))
            .transition(.fade)
            .scaledToFit()
    }

    private var title: some View {
        Text(word.word.uppercased())
            .font(.system(size: Size.xxLarge()))
            .foregroundColor(Color(hex: 0x3F3F3F))
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
                .font(.system(size: Size.xLarge()))
                .foregroundColor(Color(hex: 0x3F3F3F))
                .opacity(0.7)
                .padding(.bottom, Size.xxSmall())

            if !lexicalEntry.phrases.isEmpty {
                collapsibleSection(title: Localisation.phrases(), content: lexicalEntry.phrases)
            }

            senses(for: lexicalEntry)
        }
    }

    private var phoneticSubSection: some View {
        HStack {
            if let phoneticSpelling = word.pronunciation.phoneticSpelling,
               let phoneticNotation = word.pronunciation.phoneticNotation {
                Text(phoneticSpelling)
                    .foregroundColor(Color(hex: 0x3F3F3F))

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
                    section(title: Localisation.definitions(), content: sense.definitions)
                }

                if !sense.shortDefinitions.isEmpty {
                    section(title: Localisation.shortDefinitions(), content: sense.shortDefinitions)
                }

                if !sense.examples.isEmpty {
                    section(title: Localisation.examples(), content: sense.examples)
                }

                if !sense.synonyms.isEmpty {
                    collapsibleSection(title: Localisation.synonyms(), content: sense.synonyms)
                }

                if !sense.antonyms.isEmpty {
                    collapsibleSection(title: Localisation.antonyms(), content: sense.antonyms)
                }
            }
        }
    }

    // MARK: - Helpers
    private func section(title: String, content: [String]) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: Localisation.shortDefinitions())
            ForEach(content, id: \.self) { contentItem in
                bulletRow(for: contentItem)
            }
        }
        .padding(.bottom, Size.xxSmall())
    }

    private func collapsibleSection(title: String, content: [String]) -> some View {
        VStack (alignment: .leading) {
            CollapsibleView(
                label: {
                    subSectionHeader(for: title)
                },
                content: {
                    ForEach(content, id: \.self) { contentItem in
                        bulletRow(for: contentItem)
                    }
                }
            )
        }
        .padding(.bottom, Size.xxSmall())
    }

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
            .font(.system(size: Size.large()))
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

// MARK: - Previews
struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: .basketball)
    }
}
