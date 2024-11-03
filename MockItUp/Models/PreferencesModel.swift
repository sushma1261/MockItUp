//
//  PreferencesModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation


struct PreferencesModel: Identifiable, Decodable, Encodable {
    let id: String
    var level: String
    let question: String
    var jobType: String
    var yoe: String
    var companyName: String
    var jobDescription: String
    
    init() {
        self.id = UUID().uuidString
        self.level = ""
        self.question = ""
        self.jobType = ""
        self.yoe = ""
        self.companyName = ""
        self.jobDescription = ""
    }
    
    init(id: String = UUID().uuidString, level: String ,question: String,
         jobType: String,
         yoe: String,
         companyName: String,
         jobDescription: String
    ) {
        self.id = id
        self.level = level
        self.question = question
        self.jobType = jobType
        self.yoe = yoe
        self.companyName = companyName
        self.jobDescription = jobDescription
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        level = try container.decode(String.self, forKey: .level)
//        question = try container.decode(String.self, forKey: .question)
//        jobType = try container.decode(String.self, forKey: .jobType)
//        yoe = try container.decode(String.self, forKey: .yoe)
//        companyName = try container.decode(String.self, forKey: .companyName)
//        jobDescription = try container.decode(String.self, forKey: .jobDescription)
//    }
    
}
