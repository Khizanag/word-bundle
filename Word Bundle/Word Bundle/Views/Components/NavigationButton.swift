//
//  NavigationButton.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct NavigationButton<DestinationType: View>: View {
    // MARK: - Properties
    let buttonTitle: String
    let destination: DestinationType

    // MARK: - Body
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(buttonTitle)
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
        NavigationButton(buttonTitle: Localisation.getStarted(), destination: MainView())
    }
}
