//
//  WelcomeView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                image
                titleLabel
                descriptionLabel
                Spacer()
                getStartedButton
                Spacer()
            }
        }
    }

    var image: some View {
        DesignSystem.Image.booksAndMobile()
            .padding(.bottom)
    }

    var titleLabel: some View {
        Text(Localisation.welcomePageTitle())
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(DesignSystem.Color.primaryTextDark().value)
            .multilineTextAlignment(.center)
            .padding(.all)
            .padding(.horizontal)
    }

    var descriptionLabel: some View {
        Text(Localisation.welcomePageDescription())
            .foregroundColor(DesignSystem.Color.secondaryTextDark().value)
            .foregroundColor(DesignSystem.Color.secondaryTextDark().value)
            .multilineTextAlignment(.center)
            .padding(.all)
    }

    var getStartedButton: some View {
        NavigationLink(destination: ContentView()) {
            HStack {
                Text("Get Started")
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

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
