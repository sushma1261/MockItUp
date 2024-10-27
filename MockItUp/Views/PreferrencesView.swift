//
//  PreferrencesView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct PreferrencesView: View {
    
    @State var level: String = ""
    @State var yoe: String = ""
    @State var companyName: String = ""
    @State var jobDescription: String = ""
    @ObservedObject var preference: PreferencesViewModel = PreferencesViewModel()
    
    
    var body: some View {
        NavigationStack
        {
            VStack {
                HStack {
                    CustomTextField(title: "Job Type", variable: $preference.preferenceModal.jobType, styleType: "test")
                    CustomTextField(title: "Level", variable: $preference.preferenceModal.level, styleType: "test")
                }
                CustomTextField(title: "Years of Experience", variable: $preference.preferenceModal.yoe, styleType: "test")
                CustomTextField(title: "Company Name", variable: $preference.preferenceModal.companyName, styleType: "test")
                CustomTextField(title: "Job Description", variable: $preference.preferenceModal.jobDescription, styleType: "test")
                NavigationLink {
                    HomeView()
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
                /*.navigationDestination(isPresented: $isPresented, destination: HomeView) */
                Spacer()
            }
        }
        .padding(16)
        
        
    }
}

#Preview {
    NavigationStack {
        PreferrencesView()
    }
}
