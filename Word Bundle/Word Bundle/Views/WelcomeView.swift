//
//  WelcomeView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @AppStorage(AppStorageKeys.isFirstRun()) private var isFirstRun = true

    var body: some View {
            ScrollView {
                VStack(alignment: .center) {
                    DesignSystem.Image.booksAndMobile(isSystemName: false)
                        .padding(.bottom)
                    titleLabel
                    descriptionLabel
                    Spacer()
                    NavigationButton(title: Localisation.getStarted(), destination: RemindersSettingView())
                    Spacer()
                }
                .navigationTitle(Localisation.wordBundle())
            }
            .onAppear { // isFirstRun
                if isFirstRun {
                    saveExampleWordBundle()
                    isFirstRun = false
                }
            }
            .padding(.bottom)
    }

    private var titleLabel: some View {
        Text(Localisation.welcomePageTitle())
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(DesignSystem.Color.primaryTextDark().value)
            .multilineTextAlignment(.center)
            .padding()
            .padding(.horizontal)
    }

    private var descriptionLabel: some View {
        Text(Localisation.welcomePageDescription())
            .foregroundColor(DesignSystem.Color.secondaryTextDark().value)
            .multilineTextAlignment(.center)
            .padding()
    }

    // MARK: - Functions
    private func saveExampleWordBundle() {
        let exampleWordBundle = WordBundle.example
        let entity = WordBundleEntity(context: viewContext)

        entity.id = exampleWordBundle.id
        entity.name = exampleWordBundle.name
        entity.language = exampleWordBundle.language
        entity.creationDate = exampleWordBundle.creationDate
        entity.note = exampleWordBundle.note
        entity.isFavourited = exampleWordBundle.isFavourited

        withAnimation {
            saveContext()
        }
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}

// MARK: - Previews
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
