//
//  PreferencesViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation
import GoogleGenerativeAI
import SwiftUICore

var list2 = ["Describe a challenging web development project you worked on and how you overcame technical hurdles.",
"Explain your understanding of RESTful APIs, and provide an example of a well-designed API endpoint you would create for a social media application."]


@MainActor
class PreferencesViewModel: ObservableObject {
    
    @Published var level: String = ""
    @Published var preferenceModal: PreferencesModel = PreferencesModel()
    let JOB_PREFERENCES: String = "job_preferences"
    @Published var questionViewModel: QuestionViewModel
    
    
    
    
    @Published var text: String = "Hello"
    var generationConfig: GenerationConfig = GenerationConfig(responseMIMEType: "application/json")
    init(questionViewModel: QuestionViewModel) {
        self.questionViewModel = questionViewModel
        geInitPreferences()
    }
    
    init() {
        self.questionViewModel = QuestionViewModel()
        geInitPreferences()
    }
    
    func getPreferences() async -> PreferencesModel {
        return preferenceModal
    }

    func geInitPreferences() {
        if let data = UserDefaults.standard.data(forKey: JOB_PREFERENCES) {
            if let decoded = try? JSONDecoder().decode(PreferencesModel.self, from: data) {
                preferenceModal = decoded
                return
            }
        }
    
    }

    func savePreferences() {
        if let encoded = try? JSONEncoder().encode(preferenceModal) {
            UserDefaults.standard.set(encoded, forKey: JOB_PREFERENCES)
        }
        
    }
    
    func getFromLLM() async throws {
//        try await getFromGeminiAPI()
        try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
//        text = "Changed after 5 seconds"
        questionViewModel.setQuestions(questions: list2)
        print("QuestionsList:: ", questionViewModel.questionsList)

    }
    
    func getFromGeminiAPI() async throws {
        if let secretKey = Bundle.main.object(forInfoDictionaryKey: "ApiSecret") as? String {
            print("Secret Key: \(secretKey)")
            let generativeModel =
              GenerativeModel(
                name: "gemini-1.5-flash",
                apiKey: secretKey,
                generationConfig: generationConfig
              )
            let prompt = "Return list of 10 interview questions for a swe role. Give it in the json format of an array of strings and key as questions for the array. Schema: {questions: [str]"
            let response = try await generativeModel.generateContent(prompt)
            if let text = response.text {
                print("Original Text: \(text)")
                // Convert text to Data
                if let jsonData = text.data(using: .utf8) {
                    do {
                        if let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                            print("JSON Object: \(jsonObject)")
                            print(jsonObject.keys)
                            print(jsonObject.values)
                            if let q = jsonObject["questions"] as? [String] {
                                questionViewModel.setQuestions(questions: q)
                            }
                        } else {
                            print("Failed to convert text to JSON Dictionary.")
                        }
                    } catch {
                        print("Error converting text to JSON: \(error.localizedDescription)")
                    }
                } else {
                    print("Failed to convert text to Data.")
                }
            }
        }
    }
    
}
