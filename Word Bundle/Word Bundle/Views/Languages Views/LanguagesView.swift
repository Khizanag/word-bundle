//
//  LanguagesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 09.09.22.
//

import Steps
import SwiftUI

struct LanguagesView: View {
    @ObservedObject private var stepsState: StepsState<Item>
    @State var chosenLanguage = Language.english
    @State private var bundleTitle: String = ""
    
    private let items = [
        Item(title: "Language", image: Image(systemName: "circle")), // TODO: localization
        Item(title: "Title", image: Image(systemName: "textformat")), // TODO: localization
    ]
    
    init() {
        stepsState = StepsState(data: items)
    }
    
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
                nextButton(title: "Keep Going") // TODO: localization
            } else {
                chooseTitleView
                    .padding(.bottom, 48)
                nextButton(title: "Create Bundle") // TODO: localization
                backButton(title: "BACK TO LANGUAGE PAGE") // TODO: localization
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(!isLanguagePage)
        .navigationBarTitle(isLanguagePage ? "Choose Langugage" : "Add bundle title") // TODO: localization
    }
    
    private var isLanguagePage: Bool {
        stepsState.currentIndex == 0
    }
    
    private var chooseTitleView: some View {
        VStack {
            HStack(alignment: .center) {
                Image(systemName: "doc.plaintext")
                    .font(.headline)
                    .foregroundColor(.black)
                    .opacity(0.7)
                    .padding(.leading)
                
                TextField("Type Bundle Title", text: $bundleTitle) // TODO: localization
                    .opacity(0.85)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
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
                    LanguageView(language: language, chosenLanguage: $chosenLanguage)
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
    
    private func nextButton(title: String) -> some View {
        Button(
            action: {
                withAnimation {
                    stepsState.nextStep()
                }
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
    
    private func backButton(title: String) -> some View {
        Button(
            action: {
                withAnimation {
                    stepsState.previousStep()
                }
            },
            label: {
                HStack {
                    Image(systemName: "chevron.backward")

                    Text(title)
                }
                .font(.footnote)
                .foregroundColor(Color(hex: 0x3F3F3F))
                .opacity(0.8)
            }
        )
    }
    
    private struct Item {
        var title: String
        var image: Image?
    }
    
    private func onCreateStep(_ item: Item) -> Step {
        Step(title: item.title, image: item.image)
    }
}


struct LanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesView()
    }
}
