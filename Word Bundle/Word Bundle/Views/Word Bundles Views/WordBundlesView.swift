//
//  WordBundlesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlesView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @AppStorage(AppStorageKeys.activeWordBundleId()) var activeWordBundleId: UUID = WordBundle.example.id

    @Binding var selection: TabItem
    @State private var isActionSheetPresented = false

    @FetchRequest(entity: WordBundleEntity.entity(), sortDescriptors: [])
    private var wordBundleEntities: FetchedResults<WordBundleEntity>

    var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Size.xxxLarge()) {
                NavigationLink(destination: CreateWordBundleView()) {
                    AddWordBundleItemView()
                }

                ForEach(wordBundleEntities, id: \.id) { wordBundleEntity in
                    WordBundlePreviewItemView(wordBundle: .make(from: wordBundleEntity), activeWordBundleId: $activeWordBundleId)
                        .onTapGesture {
                            activeWordBundleId = wordBundleEntity.id
                        }
                        .onLongPressGesture {
                            isActionSheetPresented = true
                        }
                        .actionSheet(isPresented: $isActionSheetPresented) {
                            .init(
                                title: Text(Localisation.bundleDeleteActionSheetTitle()),
                                message: Text(Localisation.bundleDeleteActionSheetMessage()),
                                buttons: [
                                    .destructive(Text(Localisation.delete())) {
                                        viewContext.delete(wordBundleEntity)
                                        withAnimation {
                                            saveContext()
                                        }
                                    },
                                    .cancel()
                                ]
                            )
                        }
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
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

struct WordBundlesView_Previews: PreviewProvider {
    static var previews: some View {
        WordBundlesView(selection: .init(projectedValue: .constant(.words)))
    }
}
