//
//  HomeView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import SwiftUI
import SwiftUIPager

struct HomeView: View {
    @State var page: Page = .first()
    @State var wordBundle: WordBundle = .example

    let colors: [Color] = [
        .blue, .gray, .red, .green
    ]

    var body: some View {
        Pager(page: page, data: wordBundle.words.shuffled(), id: \.id) { word in
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

                    NavigationButton(title: "Show word detailed...", destination: WordView(word: word))
                        .offset(y: 96)
                }
                .padding()
            }
        }
        .sensitivity(.low)
        .vertical()
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
