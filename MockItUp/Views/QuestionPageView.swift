//
//  UploadView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct QuestionPageView: View {
    @State var questionModel: QuestionModel
    @State private var importing = false
    @State private var importStatus: String = "Not started"
    var body: some View {
        VStack {
            Spacer()
            Text(questionModel.question)
            Spacer()
            Button {
                // QuestionsListView.self
                importing = true
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
            .fileImporter(
                isPresented: $importing,
                allowedContentTypes: [.plainText]
            ) { result in
                switch result {
                case .success(let file):
                    importStatus = "Successful!!"
                    print(file.absoluteString)
                case .failure(let error):
                    importStatus = "Failed!!"
                    print(error.localizedDescription)
                }
            }
            Text("Import Status: " + importStatus)
            Spacer()
        }
        .padding(20)
    }
}

#Preview {
    QuestionPageView(questionModel: QuestionModel(title: "Practice question 1"))
}
