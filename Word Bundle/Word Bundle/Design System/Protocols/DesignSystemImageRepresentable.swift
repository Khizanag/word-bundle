//
//  DesignSystemImageRepresentable.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 18.07.22.
//

import SwiftUI

public protocol DesignSystemImageRepresentable {
    func callAsFunction() -> Image?
}

extension DesignSystemImageRepresentable where Self: RawRepresentable, Self.RawValue == String {
    private var named: String {
        String(reflecting: type(of: self))
            .replacingOccurrences(of: "DesignSystem.DesignSystem.Image", with: "") // FIXME: fix to correct path
            .replacingOccurrences(of: ".", with: "/")
            .appending("/" + rawValue)
            .deletingPrefix("/")
    }

    public func callAsFunction() -> Image? {
        Image(named)
    }
}
