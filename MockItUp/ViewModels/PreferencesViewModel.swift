//
//  PreferencesViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation

class PreferencesViewModel: ObservableObject {
    
    @Published var level: String = ""
    @Published var preferenceModal: PreferencesModel = PreferencesModel()
    let JOB_PREFERENCES: String = "job_preferences"
    
    init() {
        geInitPreferences()
    }
    
    func getPreferences() -> PreferencesModel {
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
    
}
