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
                            let deleteButton = ActionSheet.Button.destructive(Text("Delete")) { // TODO: Localization
                                viewContext.delete(wordBundleEntity)
                                withAnimation {
                                    saveContext()
                                }
                            }

                            let cancelButton = ActionSheet.Button.cancel()

                            return .init(
                                title: Text("You are going to delete selected `Word Bundle`"), // TODO: Localization
                                message: Text("Are you sure?"), // TODO: Localization
                                buttons: [deleteButton, cancelButton]
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
