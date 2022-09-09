//
//  AddWordBundleItemView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 08.09.22.
//

import SwiftUI

struct AddWordBundleItemView: View {
    var body: some View {
        ZStack {
            Color(hex: 0x039be5) // TODO: fix this
                .opacity(0.6)
            HStack (alignment: .center) {
                Text(Localisation.addNewBundle())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()

                Spacer()

                DesignSystem.Image.plus()
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
            }
        }
        .frame(height: 96)
        .cornerRadius(DesignSystem.Size.xxLarge())
        .padding(.horizontal, 32)
    }
}

struct AddWordBundleItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordBundleItemView()
    }
}
