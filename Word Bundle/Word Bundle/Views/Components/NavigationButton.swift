//
//  NavigationButton.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct NavigationButton<DestinationType: View>: View {
    // MARK: - Properties
    let title: String
    let destination: DestinationType

    // MARK: - Body
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(DesignSystem.Color.color3().value)
            .cornerRadius(8)
            .padding()
        }
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(title: Localisation.getStarted(), destination: MainView())
    }
}
