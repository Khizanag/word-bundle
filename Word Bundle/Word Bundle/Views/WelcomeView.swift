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
    private let imageRepository: ImageRepository = UnsplashImageRepository()
    @State private var textFieldText = ""
    @State private var player: AVPlayer?
    @State private var words: [Word] = []
    @State private var isButtonLoading = false
    @State private var isTextFieldDisabled = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    DesignSystem.Image.booksAndMobile()
                        .padding(.bottom)
                    titleLabel
                    descriptionLabel
                    Spacer()
                    NavigationButton(title: Localisation.getStarted(), destination: RemindersSettingView(words: words))
                    Spacer()
                }
                .navigationTitle(Localisation.wordBundle())
            }
            .padding(.bottom)
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
