//
//  WordBundlesView.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 07.09.22.
//

import SwiftUI

struct WordBundlesView: View {
    @Binding var selection : TabItem
    @State var isActionSheetPresented = false
    
    var body: some View {
        VStack(spacing: 32) {
            NavigationLink(destination: LanguagesView()) {
                AddWordBundleItemView()
            }
            
            ForEach(WordBundle.examples.indices, id: \.self) { index in
                WordBundlePreviewItemView(wordBundle: WordBundle.examples[index])
                    .onTapGesture {
                        selection = .words
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
