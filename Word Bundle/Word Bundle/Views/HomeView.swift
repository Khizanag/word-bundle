//
//  HomeView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 21.07.22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            DesignSystem.Color.color3()()
                .ignoresSafeArea()
                .padding(.bottom)
            Text("Hello, World HOMEEEE")
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
