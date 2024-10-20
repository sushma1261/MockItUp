//
//  HomeView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var questionsList: [QuestionModel] = [
        QuestionModel(title: "Practice Question 1"),
        QuestionModel(title: "Practice Question 2"),
        QuestionModel(title: "Practice Question 3"),
        QuestionModel(title: "Practice Question 4")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(questionsList) { ques in
                    QuestionsListView(ques: ques)
                        .safeAreaPadding(8)
                }
            }
        }
        .navigationTitle("Questions List")
        
    }
}

#Preview {
    HomeView()
}
