//
//  ThemeView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 12.08.22.
//

import SwiftUI

struct ThemeView: View {
    private typealias Size = DesignSystem.Size
    var theme: Theme
    
    var body: some View {
        ZStack {
            let rect = RoundedRectangle(cornerRadius: Size.medium())
            if theme.isEmpty {
                rect.stroke(.black)
                VStack {
                    Spacer()
                    Text("+ New Theme")
                        .font(.system(size: Size.large()))
                        .padding(Size.xSmall())
                }
            } else {
                rect.fill(theme.color)
                if theme.isSelected {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "checkmark") // TODO: add to constants
                                .padding(Size.xSmall())
                        }
                        Spacer()
                    }
                    
                }
                
            }
        }
    }
}

