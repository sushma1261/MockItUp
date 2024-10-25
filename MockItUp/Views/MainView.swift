//
//  MainView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct MainView: View {
    @State var selection: String = ""
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack() {
                HomeView()
            }
            .tabItem {
                Text("Home")
                Image(systemName: "house.fill")
                    .renderingMode(.template)
            }
            .tag(0)
            
            
            
            NavigationStack() {
                PreferrencesView()
                    .navigationTitle("Preferences")
            }
            .tabItem {
                Text("Preferences")
                Image(systemName: "gearshape")
                    .renderingMode(.template)
            }
            .tag(1)
            
            NavigationStack() {
                FeedbackView()
                    .navigationTitle("Feedback")
            }
            .tabItem {
                Text("Feedback")
                Image(systemName: "list.bullet.clipboard")
                    .renderingMode(.template)
            }
            .tag(2)
            
            NavigationStack() {
                Text("My Account")
                    .navigationTitle("My Account")
                
            }
            .tabItem {
                Text("My Account")
                Image(systemName: "person.fill")
                
            }
            .tag(3)
        }
    }
}

#Preview {
    MainView()
}
