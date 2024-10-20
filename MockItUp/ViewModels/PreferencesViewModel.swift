//
//  PreferencesViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation

class PreferencesViewModel: ObservableObject {
    
    @Published var preferences: PreferencesModel
//    = [] {
//        didSet {
//            savePreferencesToUserDefaults()
//        }
//    }
    
    let JOB_PREFERENCES: String = "job_preferences"
    
    init() {
//        getItems()
        self.preferences = PreferencesModel(id: "Id1", level: "Easy")
    }
    
    func getItems() -> PreferencesModel {
//        self.preferences = PreferencesModel(id: "Id1", level: "Easy")
        return preferences;
//        guard
//            let data = UserDefaults.standard.data(forKey: JOB_PREFERENCES),
//            let savedItems = try? JSONDecoder().decode(PreferencesModel.self, from: data)
//        
//        else { return }
//        self.preferences = savedItems
//        print(savedItems)
    }
    
//    func savePreferencesToUserDefaults() {
//        if let encodedData = try? JSONEncoder().encode(preferences) {
//            UserDefaults.standard.set(encodedData, forKey: JOB_PREFERENCES)
//        }
//    }
    
}
