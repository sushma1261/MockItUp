//
//  AudioAnswer.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/11/24.
//

/*
 See LICENSE folder for this sample’s licensing information.
 */

import Foundation

struct AudioAnswer: Identifiable, Codable {
    let id: UUID
    var questionId: String
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var history: [AudioHistory] = []
    
    init(id: UUID = UUID(), questionId: String, lengthInMinutes: Int) {
        self.id = id
        self.questionId =  questionId
        self.lengthInMinutes = lengthInMinutes
    }
    
    static var emptyAnswer: AudioAnswer {
        AudioAnswer(questionId: "", lengthInMinutes: 5)
    }
}

extension AudioAnswer {
    static let sampleData: [AudioAnswer] =
    [
        AudioAnswer(
                    questionId: "ques1",
                   lengthInMinutes: 10),
        AudioAnswer(
                    questionId: "ques2",
                   lengthInMinutes: 2)
    ]
}
