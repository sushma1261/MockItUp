//
//  PreferrencesView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct PreferrencesView: View {
    
    
//    @EnvironmentObject var preferencesViewModel: PreferencesViewModel

//    @State private var selectedLevel: Levels = .easy
    @State var jobType: String = ""
    @State var level: String = "asd"
    @State var yoe: String = ""
    @State var companyName: String = ""
    @State var jobDescription: String = ""
    
    @StateObject var preference: PreferencesViewModel = PreferencesViewModel()
    
    var body: some View {
        VStack {
            HStack {
                TextField("Job Type", text: $preference.level)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                TextField("Level", text: $level)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
            }

            TextField("Years of Experience", text: $yoe)
                .keyboardType(.decimalPad)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            TextField("Company Name", text: $companyName)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            
            TextField("Job Description", text: $jobDescription)
                .padding(.horizontal)
                .frame(height: 150)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            Button {
                // QuestionsListView.self
                preference.savePreferences()
            } label: {
                Text("Submit")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding(20)
            }
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    NavigationStack {
        PreferrencesView()
    }
}
