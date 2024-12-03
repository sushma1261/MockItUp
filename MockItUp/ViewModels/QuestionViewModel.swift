//
//  QuestionViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/10/24.
//

import Foundation
import GoogleGenerativeAI

var list = ["Describe a challenging web development project you worked on and how you overcame technical hurdles.",
"Explain your understanding of RESTful APIs, and provide an example of a well-designed API endpoint you would create for a social media application.",
"How would you handle front-end performance optimization for a web application with high user traffic? Provide specific examples.",
"Walk me through the process of implementing authentication and authorization in a web application, considering security best practices.",
"Imagine you are building a feature to display real-time notifications. What technologies and patterns would you use to ensure efficiency and scalability? Discuss the potential challenges.",
"Explain the concept of version control using Git, and describe a situation where you had to resolve a merge conflict.",
"What are your preferred testing methodologies for both front-end and back-end code? Discuss how you approach testing in a collaborative development environment.",
"Tell me about a time you had to learn a new programming language or technology outside of your usual work. What strategies did you employ? ",
"How would you contribute to a team working on a large-scale software project, specifically considering communication and collaboration? ",
"What are some of the current trends in web development that you are most interested in? How do you keep your skills up-to-date?"]


class QuestionViewModel: ObservableObject {
    
    @Published var questionsList: [QuestionModel] = []
    
    init() {
        questionsList = list.map { QuestionModel(title: $0) }
    }
    
    func getQuestion() -> [QuestionModel] {
        return questionsList
    }
}
