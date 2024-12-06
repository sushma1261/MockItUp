//
//  HomeView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI


struct HomeView: View {
    
    @State var isPresented = false
    
    @Binding var questionsList: [QuestionModel]
    @Binding var changeText: String
    var body: some View {
        Spacer()
//        Text(changeText)
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
//        .onAppear() {
////            self.questionsList = []
//            print("appear",questionsList)
//        }
//        .onDisappear() {
//            print("disappear", questionsList)
//        }
    }
}

#Preview {
    HomeView(questionsList: .constant( QuestionViewModel.sampleQuestionsList), changeText: .constant("Test"))
}
