//
//  WordView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 26.07.22.
//

import SwiftUI

struct WordView: View {
    let word: Word

    var body: some View {
        ZStack {
            Color.gray
            Text(word.word)
                .font(.largeTitle)
                .foregroundColor(DesignSystem.Color.primaryTextLight()())
        }
//        .navigationBarHidden(true)
        .navigationTitle(word.word)
        .ignoresSafeArea()
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: .good)
    }
}
