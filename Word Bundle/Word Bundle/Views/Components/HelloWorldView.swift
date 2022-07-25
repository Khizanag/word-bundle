//
//  HelloWorldView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import SwiftUI

struct HelloWorldView: View {
    let text: String

    var body: some View {
        ZStack {
            DesignSystem.Color.color3()()
                .ignoresSafeArea()
                .padding(.bottom)
            Text("Hello, World! \(text)")
        }
    }
}

struct HelloWorldView_Previews: PreviewProvider {
    static var previews: some View {
        HelloWorldView(text: "")
    }
}
