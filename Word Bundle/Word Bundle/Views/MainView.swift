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
            DesignSystem.Color.color3()()

            TabView {
                HelloWorldView(text: "Giga")
                    .tabItem {
                        Image(systemName: "phone.fill")
                        Text("calls")
                    }
                HelloWorldView(text: "Library")
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("Library")
                    }
                HelloWorldView(text: "Homeeee")
                    .tabItem {
                        Image(systemName: "scroll.fill")
                        Text("Home")
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
