//
//  LoadingButton.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 05.09.22.
//

import SwiftUI

/// source of idea: https://github.com/changemin/LoadingButton/blob/main/Sources/LoadingButton/LoadingButton.swift

public struct LoadingButton<Content: View>: View {
    @Binding var isLoading: Bool

    private let style: LoadingButtonStyle
    private let content: Content
    private let action: () -> Void

    public init(action: @escaping () -> Void, isLoading: Binding<Bool>, style: LoadingButtonStyle? = nil, @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        self.style = style ?? LoadingButtonStyle()
        self.content = builder()
        self.action = action
    }

    public var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
            isLoading = true
        }, label: {
            ZStack {
                Rectangle()
                    .fill(isLoading ? style.loadingBackgroundColor : style.backgroundColor)
                    .frame(width: isLoading ? style.height : style.width, height: style.height)
                    .cornerRadius(isLoading ? style.height/2 : style.cornerRadius)

                if isLoading {
                    CircleLoadingBar(style: style)
                } else {
                    content
                }
            }
        })
        .frame(width: style.width, height: style.height)
        .disabled(isLoading)
    }
}
