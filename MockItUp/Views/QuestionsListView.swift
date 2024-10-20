//
//  QuestionsListView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct QuestionsListView: View {
    @State var ques: QuestionModel
    var body: some View {
        Text(ques.question)
    }
}

#Preview {
    QuestionsListView(ques: QuestionModel(title: "Practice question 1"))
}
