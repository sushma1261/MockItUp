//
//  QuestionModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation

struct QuestionModel: Identifiable, Codable {
    let id: String
    let question: String
//    let tags, attemptedOrNot,
    
    init(id: String = UUID().uuidString, title: String) {
        self.id = id
        self.question = title
    }
    
    
}


//@State private var selectedLevel: Levels = .easy
//@State var jobType: String = ""
//@State var level: String = ""
//@State var yoe: String = ""
//@State var companyName: String = ""
//@State var jobDescription: String = ""
