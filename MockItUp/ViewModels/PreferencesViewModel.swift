//
//  PreferencesViewModel.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import Foundation

class PreferencesViewModel: ObservableObject {
    
//    @Published var preferences: [PreferencesModel] = [] {
//        didSet {
//            savePreferencesToUserDefaults()
//        }
//    }
//    
//    let itemsKey: String = "job_preferences"
//    
//    init() {
//        getItems()
//    }
//    
//    func getItems() {
//        guard
//            let data = UserDefaults.standard.data(forKey: itemsKey),
//            let savedItems = try? JSONDecoder().decode([PreferencesModel].self, from: data)
//        else { return }
//
//        self.preferences = savedItems
//    }
//    
//    func savePreferencesToUserDefaults() {
//        if let encodedData = try? JSONEncoder().encode(preferences) {
//            UserDefaults.standard.set(encodedData, forKey: itemsKey)
//        }
//    }
//    
}
