//
//  MainView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct MainView: View {
    @State var selection = 0
//    @StateObject var preferencesViewModel: PreferencesViewModel = PreferencesViewModel()
//    @StateObject private var store = ScrumStore()
//    @State private var errorWrapper: ErrorWrapper?
    @ObservedObject var questionViewModel: QuestionViewModel = QuestionViewModel()
//    @ObservedObject var preference: PreferencesViewModel = PreferencesViewModel(questionViewModel: questionViewModel)
    @Binding var audios: [QuestionModel]
    let saveAction: ()->Void
    @Environment(\.scenePhase) private var scenePhase
//    print(audios)
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack() {
                HomeView(questionsList: questionViewModel.getQuestion())
            }
            .tabItem {
                Text("Home")
                Image(systemName: "house.fill")
                    .renderingMode(.template)
            }
            .tag(0)
            
            NavigationStack() {
                PreferrencesView(questionViewModel: questionViewModel)
                    .navigationTitle("Preferences")
            }
            .tabItem {
                Text("Preferences")
                Image(systemName: "gearshape")
                    .renderingMode(.template)
            }
            .tag(1)
            
//            NavigationStack() {
//                FeedbackView()
//                    .navigationTitle("Feedback")
//            }
//            .tabItem {
//                Text("Feedback")
//                Image(systemName: "list.bullet.clipboard")
//                    .renderingMode(.template)
//            }
//            .tag(2)
//            
//            NavigationStack() {
//                ContentView()
////                Text("My Account")
//                    .navigationTitle("My Account")
//
//            }
//            .tabItem {
//                Text("My Account")
//                Image(systemName: "person.fill")
//
//            }
//            .tag(3)
            
//            NavigationStack() {
//                ScrumsView(scrums: $store.scrums) {
//                    Task {
//                        do {
//                            try await store.save(scrums: store.scrums)
//                        } catch {
//                            errorWrapper = ErrorWrapper(error: error,
//                                                        guidance: "Try again later.")
//                        }
//                    }
//                }
//                .task {
//                    do {
//                        try await store.load()
//                    } catch {
//                        errorWrapper = ErrorWrapper(error: error,
//                                                    guidance: "Scrumdinger will load sample data and continue.")
//                    }
//                }
//                .sheet(item: $errorWrapper) {
//                    store.scrums = DailyScrum.sampleData
//                } content: { wrapper in
//                    ErrorView(errorWrapper: wrapper)
//                }
//                .navigationTitle("Scrums")
//
//                }
//                .tabItem {
//                    Text("Scrums")
//                    Image(systemName: "person.fill")
//
//                }
//                .tag(3)
        }
        .onChange(of: scenePhase) { phase in
            print("Onchange called", phase)
            saveAction()
        }
//        .environmentObject(preferencesViewModel)
    }
}

#Preview {
    MainView( audios: .constant(QuestionModel.sampleData), saveAction: {})
}
