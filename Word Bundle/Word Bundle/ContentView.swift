//
//  ContentView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 23.04.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Color.clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
