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
            HStack (alignment: .center) {
                Text("Add New Bundle")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()

                Spacer()

                Image(systemName: "plus")
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
