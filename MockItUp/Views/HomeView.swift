//
//  HomeView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI


struct HomeView: View {
    
    @State var isPresented = false
    
    @ObservedObject var questionsList: QuestionViewModel = QuestionViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(questionsList.questionsList) { ques in
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
    HomeView()
}
