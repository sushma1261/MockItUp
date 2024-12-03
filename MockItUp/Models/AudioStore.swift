//
//  AudioStore.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/11/24.
//

import SwiftUI

@MainActor
class AudioStore: ObservableObject {
    @Published var audios: [QuestionModel] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("answers.data")
    }
    
    func load() async throws {
        print("Load....")
        let task = Task<[QuestionModel], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                print("file not found", fileURL)
                return []
            }
            print("data", data)
            let AudioAnswers = try JSONDecoder().decode([QuestionModel].self, from: data)
            print("retrieve", AudioAnswers)
            return AudioAnswers
        }
        let audios = try await task.value
        print(audios)

        self.audios = audios
    }
    
    func save(audioAnswers: [QuestionModel]) async throws {
        print("save called")
        let task = Task {
            let data = try JSONEncoder().encode(audioAnswers)
            print("saved", data, audioAnswers)
            do {
                let outfile = try Self.fileURL()
                print("saved in file", outfile)
                try data.write(to: outfile)
            }
            catch {
                print("error saving")
            }
            
        }
        _ = try await task.value
    }
}
