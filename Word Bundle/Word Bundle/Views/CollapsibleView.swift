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
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack (alignment: .leading) {
            Button(
                action: {
                    collapsed.toggle()
                },
                label: {
                    HStack {
                        label()
                        Image(systemName: collapsed ? "chevron.down" : "chevron.up")
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.1))
                }
            )
            .buttonStyle(.automatic)
            VStack {
                content()
            }
            
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .transition(.flipFromTop)
            .clipped()
        }
    }
}