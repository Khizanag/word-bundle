//
//  CircleLoadingBar.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 05.09.22.
//

import SwiftUI

/// source of idea: https://github.com/changemin/LoadingButton/blob/main/Sources/LoadingButton/LoadingButton.swift

struct CircleLoadingBar: View {
    @State private var isLoading = false
    @State var style: LoadingButtonStyle

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(style.strokeColor, style: StrokeStyle(lineWidth: style.strokeWidth, lineCap: .round, lineJoin: .round))
            .frame(width: style.height - 20, height: style.height - 20)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(.default.repeatForever(autoreverses: false), value: isLoading)
            .onAppear {
                self.isLoading = true
            }
    }
}
