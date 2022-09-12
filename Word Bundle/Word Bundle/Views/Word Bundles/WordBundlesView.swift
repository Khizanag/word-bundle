//
//  WordBundlesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlesView: View {
    // MARK: - Properties
    @Environment(\.managedObjectContext) private var viewContext

    @AppStorage(AppStorageKeys.activeWordBundleId()) var activeWordBundleId: UUID = WordBundle.example.id

    @FetchRequest(entity: WordBundleEntity.entity(), sortDescriptors: []) private var wordBundleEntities: FetchedResults<WordBundleEntity>

    @State private var isActionSheetPresented = false

    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Size.xxLarge()) {
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
        WordBundlesView()
    }
}
