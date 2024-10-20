//
//  PreferencesModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation


struct PreferencesModel: Identifiable, Decodable, Encodable {
    let id: String
    let level: String?
//    let question: String?
//    let jobType: String?
//    let yoe: NSNumber?
//    let companyName: String?
//    let jobDescription: String?
    
    init(id: String, level: String
//         ,question: String,
//         jobType: String,
//         yoe: NSNumber,
//         companyName: String,
//         jobDescription: String
    ) {
        self.id = id
        self.level = level
//        self.question = question
//        self.jobType = jobType
//        self.yoe = yoe
//        self.companyName = companyName
//        self.jobDescription = jobDescription
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            level = try container.decode(String.self, forKey: .level)
        }
    
}
