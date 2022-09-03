//
//  WelcomeView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI
import AVFoundation

var player: AVPlayer?


struct WelcomeView: View {
    private let dictionariesRepository: DictionariesRepository = OxfordDictionariesRepository()
    @State private var textFieldText = ""

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
                    }
                }
                
                Button("Play Sound") {
                    Task {
                        let entry = await dictionariesRepository.entries(of: textFieldText, language: .english)
                        let audioFile = entry?.results?[0].lexicalEntries[0].entries?[0].pronunciations?[0].audioFile // TODO: help
                        let url = NSURL(string: audioFile ?? "")
                           do {
                               let playerItem = AVPlayerItem(url: url! as URL)
                               player = AVPlayer(playerItem: playerItem)
                               player!.volume = 1.0
                               player!.play()
                           } catch let error as NSError { // TODO: fix warning
                               player = nil
                               print(error.localizedDescription)
                           } catch {
                               print("AVAudioPlayer init failed")
                           }
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
