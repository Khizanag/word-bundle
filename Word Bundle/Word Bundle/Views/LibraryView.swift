//
//  LibraryView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        ZStack {
            DesignSystem.Color.color3()()
                .ignoresSafeArea()
            Text("Hello, Library!")
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
