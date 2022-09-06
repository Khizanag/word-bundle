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
    @State private var words: [Word] = []
    @State private var isButtonLoading = false
    @State private var isTextFieldDisabled = false

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                DesignSystem.Image.booksAndMobile()
                    .padding(.bottom)
                titleLabel
                descriptionLabel
                Spacer()
                NavigationButton(title: Localisation.getStarted(), destination: RemindersSettingView(words: words))
                Spacer()

                TextField("Type word to search here", text: $textFieldText)
                    .disabled(isTextFieldDisabled)
                    .padding()

                enterButton
                    .frame(maxWidth: .infinity)
                    .background(DesignSystem.Color.color3().value) // FIXME: try to remove
                    .cornerRadius(8)
                    .padding()

                Button("Play last word's Sound") {
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

    private var enterButton: some View {
        LoadingButton(
            action: {
                isTextFieldDisabled = true
                isButtonLoading = true

                Task {
                    defer {
                        textFieldText = ""
                        isTextFieldDisabled = false
                        isButtonLoading = false
                    }

                    guard let word = await dictionariesRepository.entries(of: textFieldText, language: .english),
                          let audioFile = word.pronunciation.audioFile,
                          let url = URL(string: audioFile) else { return }

                    self.words.append(word)

                    let playerItem = AVPlayerItem(url: url)
                    player = AVPlayer(playerItem: playerItem)
                }
            },
            isLoading: $isButtonLoading,
            style: .init(
                width: 300,
                height: 50,
                cornerRadius: 8,
                backgroundColor: DesignSystem.Color.color3().value,
                loadingColor: .clear,
                strokeWidth: 3,
                strokeColor: .indigo
            ),
            builder: { // TODO: redesign
                Text("Add word to Dictionary")
                    .foregroundColor(.white)
            }
        )
    }
}

// MARK: - Previews
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
