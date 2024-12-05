//
//  HomeView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI


struct HomeView: View {
    
    @State var isPresented = false
    
    @State var questionsList: [QuestionModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(questionsList) { ques in
                    NavigationLink(destination: QuestionPageView(questionModel: ques)) {
                        QuestionsListView(ques: ques)
                            .safeAreaPadding(8)
                    }
                }
//                Spacer()
            }
        }
        .navigationTitle("Questions List")
    }
}

#Preview {
    HomeView(questionsList: QuestionViewModel.sampleQuestionsList)
}
