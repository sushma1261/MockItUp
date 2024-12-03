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
    
    init(id: UUID = UUID(), date: Date = Date(), questionId: String, transcript: String? = nil) {
        self.id = id
        self.date = date
        self.questionId = questionId
        self.transcript = transcript
    }
}
