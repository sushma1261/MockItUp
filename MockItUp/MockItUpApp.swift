//
//  MockItUpApp.swift
//  MockItUp
//
//  Created by Sushma Manthena on 18/10/24.
//

import SwiftUI

@main
struct MockItUpApp: App {
    @StateObject private var store = AudioStore()
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            MainView(audios: $store.audios) {
                            Task {
                                do {
                                    print("MockItUp calling store save")
                                    try await store.save(audioAnswers: store.audios)
                                } catch {
                                    print("Save error", error)
                                    errorWrapper = ErrorWrapper(error: error,
                                                                guidance: "Try again later.")
                                }
                            }
                        }
                        .task {
                            do {
                                print("MockItUp calling store load")
                                try await store.load()
                            } catch {
                                print("Load error", error)
                                errorWrapper = ErrorWrapper(error: error,
                                                            guidance: "load sample data and continue.")
                            }
                        }
                        .sheet(item: $errorWrapper) {
                            store.audios = QuestionModel.sampleData
                        } content: { wrapper in
                            ErrorView(errorWrapper: wrapper)
                        }
                    }
    }
}
