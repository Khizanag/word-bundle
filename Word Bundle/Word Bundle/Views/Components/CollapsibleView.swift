//
//  CollapsibleView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 08.09.22.
//

import SwiftUI

struct CollapsibleView<Content: View>: View {
    @State var label: () -> Text
    @State var content: () -> Content

    @State private var isCollapsed: Bool = true

    var body: some View {
        VStack (alignment: .leading) {
            Button(
                action: {
                    withAnimation {
                        isCollapsed.toggle()
                    }
                },
                label: {
                    HStack {
                        label()
                        (isCollapsed ? DesignSystem.Image.chevronRight() : DesignSystem.Image.chevronDown())
                            .foregroundColor(Color(hex: 0x3F3F3F))
                    }
                    .padding(.bottom, DesignSystem.Size.min())
                    .background(Color.white.opacity(0.1))
                }
            )
            .buttonStyle(.automatic)

            VStack {
                content()
            }

            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: isCollapsed ? 0 : .none)
            .transition(.flipFromTop)
            .clipped()
        }
    }
}
