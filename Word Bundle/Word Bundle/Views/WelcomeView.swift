//
//  WelcomeView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import AVFoundation
import SwiftUI

struct WelcomeView: View {
    private let dictionariesRepository: DictionariesRepository = OxfordDictionariesRepository()
    @State private var textFieldText = ""
    @State private var player: AVPlayer?

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                DesignSystem.Image.booksAndMobile()
                    .padding(.bottom)
                titleLabel
                descriptionLabel
                Spacer()
                NavigationButton(title: Localisation.getStarted(), destination: RemindersSettingView())
                Spacer()
                TextField("Type word to search here", text: $textFieldText)
                    .padding()
                
                Button("Fetch Data") {
                    Task {
                        let entry = await dictionariesRepository.entries(of: textFieldText, language: .english)
                        print(entry ?? "Fetched entry was nil")

                        guard let audioFile = entry?.results?[0].lexicalEntries[0].entries?[0].pronunciations?[0].audioFile else { return } // TODO: help
                        guard let url = URL(string: audioFile) else { return }
                        let playerItem = AVPlayerItem(url: url)
                        player = AVPlayer(playerItem: playerItem)
                    }
                }

                Button("Play Sound") {
                    Task {
                        await player?.seek(to: .zero)
                        player?.play()
                    }
                }
            }
            .navigationTitle(Localisation.wordBundle())
        }
    }

    private var titleLabel: some View {
        Text(Localisation.welcomePageTitle())
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(DesignSystem.Color.primaryTextDark().value)
            .multilineTextAlignment(.center)
            .padding()
            .padding(.horizontal)
    }

    private var descriptionLabel: some View {
        Text(Localisation.welcomePageDescription())
            .foregroundColor(DesignSystem.Color.secondaryTextDark().value)
            .foregroundColor(DesignSystem.Color.secondaryTextDark().value)
            .multilineTextAlignment(.center)
            .padding()
    }
}

// MARK: - Previews
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
