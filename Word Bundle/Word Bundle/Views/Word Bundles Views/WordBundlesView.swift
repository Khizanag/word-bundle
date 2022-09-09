//
//  WordBundlesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI
import swiftui_search_field_shell_line

struct WordBundlesView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @AppStorage(AppStorageKeys.activeWordBundleId()) var activeWordBundleId: UUID = WordBundle.example.id

    @Binding var selection: TabItem
    @State private var isActionSheetPresented = false
    @State private var searchFieldText = ""

    @FetchRequest(
        entity: WordBundleEntity.entity(),
        sortDescriptors: [],
        predicate: NSPredicate(format: "name CONTAINS %@", ""),
        animation: .default)
    private var wordBundleEntities: FetchedResults<WordBundleEntity>

    var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Size.xxxLarge()) {

                SearchFieldShell(text: $searchFieldText, size: .init(36))
                    .font(.body)
                    .padding([.leading, .trailing, .top])

                Divider()
//                    .padding(.bottom)

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
