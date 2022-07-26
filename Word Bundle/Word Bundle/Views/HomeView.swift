//
//  HomeView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import SwiftUIPager
import SwiftUI

struct HomeView: View {
    @State var page: Page = .first()

    @State var words: [Word] = [
        Word.example,
        Word.example,
        Word.example,
        Word.example,
        Word.example,
        Word.example
    ]

    let colors: [Color] = [
        .red, .green, .blue, .gray
    ]

    var body: some View {
        Pager(page: page, data: colors, id: \.self) { color in
            ZStack {
                color
                Text(page.index.toString())
            }
        }
        .sensitivity(.high)
        .vertical()
        .ignoresSafeArea(edges: .top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
