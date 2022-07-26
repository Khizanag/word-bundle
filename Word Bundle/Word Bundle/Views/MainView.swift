//
//  MainView.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 20.07.22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            DesignSystem.Color.color2()()
                .ignoresSafeArea()

            TabView {
                HelloWorldView(text: "Giga")
                    .tabItem {
                        Image(systemName: "phone.fill")
                        Text("Calls")
                    }
                LibraryView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("Library")
                    }
                HomeView()
                    .tabItem {
                        Image(systemName: "scroll.fill")
                        Text(Localisation.home())
                    }
                HelloWorldView(text: "Message")
                    .tabItem {
                        Image(systemName: "message.fill")
                        Text("Contact")
                    }
                HelloWorldView(text: "Brain")
                    .tabItem {
                        Image(systemName: "brain.head.profile")
                        Text("Profile")
                    }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
