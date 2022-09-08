//
//  WordBundlesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlesView: View {
    @AppStorage(AppStorageKeys.activeWordBundleId()) var activeWordBundleId: UUID = WordBundle.example.id

    @Binding var selection: TabItem
    @State private var isActionSheetPresented = false

    var body: some View {
        VStack(spacing: DesignSystem.Size.xxxLarge()) {
            AddWordBundleItemView()
            ForEach(WordBundle.examples, id: \.id) { wordBundle in
                WordBundlePreviewItemView(wordBundle: wordBundle)
                    .onTapGesture {
                        selection = .words
                        activeWordBundleId = wordBundle.id
                    }
                    .onLongPressGesture {
                        isActionSheetPresented = true
                    }
                    .actionSheet(isPresented: $isActionSheetPresented) {
                        let deleteButton = ActionSheet.Button.destructive(Text("Delete")) {
                            print("Delete button was pressed")
                            // TODO: Delete Bundle
                        }

                        let cancelButton = ActionSheet.Button.cancel()

                        return .init(
                            title: Text("You are goind to Delete Selected Word Bundle"),
                            message: Text("Are you sure?"),
                            buttons: [deleteButton, cancelButton]
                        )
                    }
            }
            Spacer()
        }
    }
}

struct WordBundlesView_Previews: PreviewProvider {
    static var previews: some View {
        WordBundlesView(selection: .init(projectedValue: .constant(.words)))
    }
}
