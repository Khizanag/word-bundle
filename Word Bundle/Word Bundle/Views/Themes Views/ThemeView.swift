//
//  ThemeView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 12.08.22.
//

import SwiftUI

struct ThemeView: View {
    private typealias Size = DesignSystem.Size
    
    let theme: Theme
    //    @State var isSelected: Bool // FIXME: using isSelected and without chosenThemeId binding
    @Binding var chosenThemeId: Int
    
    var body: some View {
        ZStack {
            let rect = RoundedRectangle(cornerRadius: Size.medium())
            rect.fill(theme.color)
                .opacity(0.8)
            rect
                .stroke(theme.color, lineWidth: 2)
            
            if chosenThemeId == theme.id {
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "checkmark.square.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(Size.small())
                    }
                    Spacer()
                }
            }
        }
    }
}
