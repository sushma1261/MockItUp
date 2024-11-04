//
//  MainView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI


struct MainView: View {
    @State var selection = 0

    @Environment(\.scenePhase) private var scenePhase
    var body: some View {
//        Text(selection)
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
                VideoContentView()
                    .navigationTitle("My Account")
                
            }
            .tabItem {
                Text("My Account")
                Image(systemName: "person.fill")
                
            }
            .tag(3)
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            print(oldPhase, newPhase)
                switch newPhase {
                case .active:
                    print("Active")
                    break
                case .inactive:
                    print("Inactive")
                    break
                case .background:
                    print("Moved to background")
                    break
                @unknown default:
                    fatalError("The app has entered an unknown state.")
                }
            }
    }
}

#Preview {
    MainView()
}
