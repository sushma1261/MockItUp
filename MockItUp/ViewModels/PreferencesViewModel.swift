//
//  PreferencesViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation
import GoogleGenerativeAI

class PreferencesViewModel: ObservableObject {
    
    @Published var level: String = ""
    @Published var preferenceModal: PreferencesModel = PreferencesModel()
    let JOB_PREFERENCES: String = "job_preferences"
    
    init() {
        geInitPreferences()
    }
    
    func getPreferences() -> PreferencesModel {
//        do {
//            try await getFromLLM()
//        } catch {
//            print(error)
//        }
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
        let generativeModel =
          GenerativeModel(
            // Specify a Gemini model appropriate for your use case
            name: "gemini-1.5-flash",
            // Access your API key from your on-demand resource .plist file (see "Set up your API key"
            // above)
            apiKey: "AIzaSyBRvxF-gmGvFcCpEqGm1xaaC8x3DAJtSBU"
          )

        let prompt = "Return list of 10 interview questions for a swe role. Give it in the format of an array of strings."
        let response = try await generativeModel.generateContent(prompt)
        if let text = response.text {
          print(text)
        }

    }
    
}
