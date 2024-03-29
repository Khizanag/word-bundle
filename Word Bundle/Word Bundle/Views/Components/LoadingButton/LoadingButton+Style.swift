//
//  LoadingButton+Style.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 05.09.22.
//

import SwiftUI

/// source of idea: https://github.com/changemin/LoadingButton/blob/main/Sources/LoadingButton/LoadingButton.swift

/// A Fully Configurable Button Style
public struct LoadingButtonStyle {
    public init(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        cornerRadius: CGFloat? = nil,
        backgroundColor: Color? = nil,
        loadingColor: Color? = nil,
        strokeWidth: CGFloat? = nil,
        strokeColor: Color? = nil
    ) {
        self.width = width ?? 312
        self.height = height ?? 54
        self.cornerRadius = cornerRadius ?? 0
        self.backgroundColor = backgroundColor ?? Color.blue
        self.loadingBackgroundColor = loadingColor ?? self.backgroundColor.opacity(0.6)
        self.strokeWidth = strokeWidth ?? 5
        self.strokeColor = strokeColor ?? .gray.opacity(0.6)
    }

    /// Width of button
    public var width: CGFloat = 312
    /// Height of button
    public var height: CGFloat = 54
    /// Corner radius of button
    public var cornerRadius: CGFloat = 0
    /// Background color of button
    public var backgroundColor: Color = .blue
    /// Background color of button when loading. 50% opacity of background color gonna be set if blank.
    public var loadingBackgroundColor: Color = .blue.opacity(0.5)
    /// Width of circle loading bar stroke
    public var strokeWidth: CGFloat = 5
    /// Color of circle loading bar stroke
    public var strokeColor: Color = .gray.opacity(0.6)
}
