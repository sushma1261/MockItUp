//
//  UploadView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct QuestionPageView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Show the question!!")
            Spacer()
            Button {
                // QuestionsListView.self
            } label: {
                Text("Select and upload file")
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
        .padding(20)
    }
}

#Preview {
    QuestionPageView()
}
