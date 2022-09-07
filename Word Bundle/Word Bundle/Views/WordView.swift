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
    @Binding var word: Word
    @State private var player: AVPlayer?
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading) {
                // For more properties: https://github.com/SDWebImage/SDWebImageSwiftUI
                AnimatedImage(url: URL(string: word.imageUrl.orEmpty))
                    .resizable()
                    .indicator(.progress)
                    .scaledToFit()
                
                HStack {
                    Text(word.word.capitalized)
                        .font(.system(size: 36))
                        .foregroundColor(Color(hex: 0x3F3F3F))
                    Button {
                        Task {
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
                
                lexicalEntries
                
            }
            .padding()
            //.ignoresSafeArea()
        }
    }
    
    private var lexicalEntries: some View {
        ForEach (0..<word.lexicalEntries.count, id: \.self) { index in
            Text(word.lexicalEntries[index].lexicalCategory)
                .foregroundColor(Color(hex: 0x3F3F3F))
                .opacity(0.7)
            Spacer()
           
            definitions(for: index)
            examples(for: index)
            phrases(for: index)
            
            if index != word.lexicalEntries.count - 1 {
                Divider()
            }
        }
    }
    
    // MARK: - Phrases Sub Section
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
    
    // MARK: - Examples Sub Section
    private func examples(for index: Int) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Examples")
            examplesRows(for: index)
            Spacer()
        }
    }
    
    private func examplesRows(for index: Int) -> some View {
        ForEach (0..<word.lexicalEntries[index].entries.count, id: \.self) { entriesIndex in
            ForEach (0..<word.lexicalEntries[index].entries[entriesIndex].senses.count, id: \.self) { sensesIndex in
                ForEach(0..<word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].examples.count, id: \.self) { examplesIndex in
                    bulletRow(for: word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].examples[examplesIndex])
                }
            }
        }
    }
    
    // MARK: - Definitions Sub Section
    private func definitions(for index: Int) -> some View {
        VStack (alignment: .leading) {
            subSectionHeader(for: "Definitions")
            definitionsRows(for: index)
            Spacer()
        }
    }
    
    private func definitionsRows(for index: Int) -> some View {
        ForEach (0..<word.lexicalEntries[index].entries.count, id: \.self) { entriesIndex in
            ForEach (0..<word.lexicalEntries[index].entries[entriesIndex].senses.count, id: \.self) { sensesIndex in
                ForEach(0..<word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].definitions.count, id: \.self) { definitionsIndex in
                    bulletRow(for:  word.lexicalEntries[index].entries[entriesIndex].senses[sensesIndex].definitions[definitionsIndex])
                }
            }
        }
    }
    
    // MARK: - Helpers
    private func bulletRow(for text: String) -> some View {
        Text("\u{2022} " + text)
            .foregroundColor(Color(hex: 0x3F3F3F))
    }
    
    private func subSectionHeader(for title: String) -> some View {
        Text(title)
            .font(.system(size: 24))
            .bold()
            .foregroundColor(Color(hex: 0x3F3F3F))
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: .init(projectedValue: .constant(.basketball)))
    }
}


