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
                        Text(word.word.capitalized)
                            .font(.system(size: 36))
                            .foregroundColor(Color(hex: 0x3F3F3F))
                        Button {
                            Task { // TODO: make seperate method for this
                                print("Button was tapped")
                                guard let audioFile = word.pronunciation.audioFile,
                                      let url = URL(string: audioFile) else { return }
                                let playerItem = AVPlayerItem(url: url)
                                player = AVPlayer(playerItem: playerItem)
                                await player?.seek(to: .zero)
                                player?.play()
                            }
                        } label: {
                            Image(systemName: "speaker.wave.3")
                        }
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
    }

    private var sections: some View {
        ForEach (0..<word.lexicalEntries.count, id: \.self) { index in
            Divider()
            Text(word.lexicalEntries[index].lexicalCategory)
                .foregroundColor(Color(hex: 0x3F3F3F))
                .opacity(0.7)
            phrases(for: index)
            Spacer()
            
            senses(for: index)  
        }
    }
    
//    private func senses(for index: Int) -> some View {
//        VStack {
//            definitions(for: index)
//            examples(for: index)
//            phrases(for: index)
//            synonyms(for: index)
//            antonyms(for: index)
//        }
//    }
    
    private func senses(for index: Int) -> some View {
        ForEach (0..<word.lexicalEntries[index].entries.count, id: \.self) { entriesIndex in
            ForEach (0..<word.lexicalEntries[index].entries[entriesIndex].senses.count, id: \.self) { sensesIndex in
                definitions(for: index, entriesIndex: entriesIndex, sensesIndex: sensesIndex)
                shortDefitinitions(for: index, entriesIndex: entriesIndex, sensesIndex: sensesIndex)
                examples(for: index, entriesIndex: entriesIndex, sensesIndex: sensesIndex)
            }
        }
    }

    // MARK: - Phrases' Sub Section
    private func phrases(for index: Int) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Phrases")
            phrasesRows(for: index)
            Spacer()
        }
    }

    private func phrasesRows(for index: Int) -> some View {
        ForEach (0..<word.lexicalEntries[index].phrases.count, id: \.self) { phraseIndex in
            bulletRow(for: word.lexicalEntries[index].phrases[phraseIndex])
        }
    }

    // MARK: - Examples' Sub Section
    private func examples(for index: Int, entriesIndex: Int, sensesIndex: Int) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Examples")
            examplesRows(for: index, entriesIndex: entriesIndex, sensesIndex: sensesIndex)
            Spacer()
        }
    }
    
    private func examplesRows(for index: Int, entriesIndex: Int, sensesIndex: Int) -> some View {
        ForEach(0..<word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].examples.count, id: \.self) { examplesIndex in
            bulletRow(for: word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].examples[examplesIndex])
        }
    }

    // MARK: - Synonyms' Sub Section
    private func synonyms(for index: Int) -> some View {
        VStack (alignment: .leading) {
            CollapsibleView(
                label: {
                    subSectionHeader(for: "Synonyms")
                },
                content: {
                    synonymsRows(for: index)
                }
            )
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }

    private func synonymsRows(for index: Int) -> some View {
        ForEach (0..<word.lexicalEntries[index].entries.count, id: \.self) { entriesIndex in
            ForEach (0..<word.lexicalEntries[index].entries[entriesIndex].senses.count, id: \.self) { sensesIndex in
                ForEach(0..<word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].synonyms.count, id: \.self) { synonymsIndex in
                    bulletRow(for: word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].synonyms[synonymsIndex])
                }
            }
        }
    }

    // MARK: - Antonyms' Sub Section
    private func antonyms(for index: Int) -> some View {
       VStack (alignment: .leading) {
            CollapsibleView(
                label: {
                    subSectionHeader(for: "Antonyms")
                },
                content: {
                    antonymsRows(for: index)
                }
            )
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }

    private func antonymsRows(for index: Int) -> some View {
        ForEach (0..<word.lexicalEntries[index].entries.count, id: \.self) { entriesIndex in
            ForEach (0..<word.lexicalEntries[index].entries[entriesIndex].senses.count, id: \.self) { sensesIndex in
                ForEach(0..<word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].antonyms.count, id: \.self) { antonymIndex in
                    bulletRow(for: word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].antonyms[antonymIndex])
                }
            }
        }
    }

    // MARK: - Definitions' Sub Section
    private func definitions(for index: Int, entriesIndex: Int, sensesIndex: Int) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Definitions")
            definitionsRows(for: index, entriesIndex: entriesIndex, sensesIndex: sensesIndex)
            Spacer()
        }
    }

    private func definitionsRows(for index: Int, entriesIndex: Int, sensesIndex: Int) -> some View {
        ForEach(0..<word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].definitions.count, id: \.self) { definitionIndex in
            bulletRow(for: word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].definitions[definitionIndex])
        }
    }
    
    
    // MARK: - Short Definitions' Sub Section
    private func shortDefitinitions(for index: Int, entriesIndex: Int, sensesIndex: Int) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Short Definitions")
            definitionsRows(for: index, entriesIndex: entriesIndex, sensesIndex: sensesIndex)
            Spacer()
        }
    }

    private func shortDefitinitionsRows(for index: Int, entriesIndex: Int, sensesIndex: Int) -> some View {
        ForEach(0..<word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].definitions.count, id: \.self) { shortDefitnitionIndex in
            bulletRow(for: word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].shortDefinitions[shortDefitnitionIndex])
        }
    }
    

    // MARK: - Helpers
    private func bulletRow(for text: String) -> some View {
        HStack {
            Text("\u{2022} " + text)
                .foregroundColor(Color(hex: 0x3F3F3F))
            Spacer()
        }
    }

    private func subSectionHeader(for title: String) -> Text {
        Text(title)
            .font(.system(size: 24))
            .bold()
            .foregroundColor(Color(hex: 0x3F3F3F))
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: .basketball)
    }
}
