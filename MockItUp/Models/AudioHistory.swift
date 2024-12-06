//
//  AudioHistory.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/11/24.
//

import Foundation

struct AudioHistory: Identifiable, Codable {
    let id: UUID
    let date: Date
    var questionId: String
    var transcript: String?
    var feedback: String?
    var references: String?
    
    init(id: UUID = UUID(), date: Date = Date(), questionId: String, transcript: String? = nil, feedback: String? = nil, references: String? = nil) {
        self.id = id
        self.date = date
        self.questionId = questionId
        self.transcript = transcript
        self.references = references
        self.feedback = feedback
    }
}

extension AudioHistory {
    static let sampleData: AudioHistory =
    AudioHistory(questionId: "qid", transcript: "test", feedback: "test", references: "test")
}
