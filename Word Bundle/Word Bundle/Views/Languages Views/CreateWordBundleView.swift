//
//  CreateWordBundleView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 09.09.22.
//

import Steps
import SwiftUI

struct CreateWordBundleView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @AppStorage(AppStorageKeys.activeWordBundleId()) private var activeWordBundleId: UUID = WordBundle.example.id

    @ObservedObject private var stepsState = StepsState(data: items)
    @State var chosenLanguage = Language.english
    @State private var bundleTitle: String = ""

    private static let items = [
        Item(title: Localisation.language(), image: Image(systemName: "circle")), // TODO: Design System
        Item(title: Localisation.title(), image: Image(systemName: "textformat")) // TODO: Design System
    ]

    var body: some View {
        VStack {
            Steps(state: stepsState, onCreateStep: onCreateStep)
                .itemSpacing(10)
                .font(.caption)
                .padding()

            Divider()

            Spacer(minLength: 0)

            if isLanguagePage {
                chooseLanguageView
                Divider()
                nextButton(title: Localisation.keepGoing())
            } else {
                chooseTitleView
                    .padding(.bottom, 48)
                nextButton(title: Localisation.createBundle()) {
                    saveNewWordBundle()
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                backButton(titled: Localisation.backToLanguagePage())
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(!isLanguagePage)
        .navigationBarTitle(isLanguagePage ? Localisation.chooseLanguage() : Localisation.addBundleTitle())
    }

    private var isLanguagePage: Bool {
        stepsState.currentIndex == 0
    }

    private var chooseTitleView: some View {
        VStack {
            HStack(alignment: .center) {
                Image(systemName: "doc.plaintext") // TODO: move to DesignSystem
                    .font(.headline)
                    .foregroundColor(.black)
                    .opacity(0.7)
                    .padding(.leading)

                TextField(Localisation.typeBundleTitle(), text: $bundleTitle)
                    .opacity(0.85)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .onSubmit {
                        print("Help") // TODO: finish this
                    }
            }
            .frame(height: 36)

            Divider()
        }
        .padding([.leading, .trailing], DesignSystem.Size.xxxLarge())
    }

    private var chooseLanguageView: some View {
        ScrollView {
            VStack {
                ForEach (Language.allCases, id: \.self) { language in
                    LanguageItemView(language: language, chosenLanguage: $chosenLanguage)
                        .onTapGesture {
                            withAnimation {
                                chosenLanguage = language
                            }
                        }

                    Divider()
                        .padding([.leading, .trailing], DesignSystem.Size.xxxLarge())
                }
            }
        }
    }

    private func nextButton(title: String, completionHandler: (() -> Void)? = nil) -> some View {
        Button(
            action: {
                withAnimation {
                    stepsState.nextStep()
                }
                completionHandler?()
            },
            label: {
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
        )
    }

    private func backButton(titled: String) -> some View {
        Button(
            action: {
                withAnimation {
                    stepsState.previousStep()
                }
            },
            label: {
                HStack {
                    Image(systemName: "chevron.backward") // TODO: move to DesignSystem

                    Text(titled)
                }
                .font(.footnote)
                .foregroundColor(Color(hex: 0x3F3F3F))
                .opacity(0.8)
            }
        )
    }

    // MARK: - Steps
    private struct Item {
        var title: String
        var image: Image?
    }

    private func onCreateStep(_ item: Item) -> Step {
        Step(title: item.title, image: item.image)
    }

    // MARK: - Private functions
    private func saveNewWordBundle() {
        let entity = WordBundleEntity(context: viewContext)

        let id = UUID()
        entity.id = id
        entity.name = bundleTitle
        entity.language = chosenLanguage
        entity.creationDate = .now
        entity.note = ""
        entity.isFavourited = false

        withAnimation {
            do {
                try viewContext.save()
                activeWordBundleId = id
            } catch {
                let error = error as NSError
                fatalError("An error occured: \(error)")
            }
        }
    }
}

struct LanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWordBundleView()
    }
}
