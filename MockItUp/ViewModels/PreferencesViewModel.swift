//
//  PreferencesViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation

class PreferencesViewModel: ObservableObject {
    
    @Published var level: String = ""
    let JOB_PREFERENCES: String = "job_preferences"
    
    init() {
        getPreferences()
    }
    
    func getPreferences() {
//        let preferences = UserDefaults.standard.value(forKey: JOB_PREFERENCES) as! PreferencesModel
//        self.level = preferences.level ?? ""
    }
    
    func savePreferences() {
//        let preferences = PreferencesModel(level: level)
        UserDefaults.standard.set(level, forKey: JOB_PREFERENCES)
    }
    
}
