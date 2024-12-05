//
//  FeedbackView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct FeedbackView: View {
    @State var speechRecognizer: SpeechRecognizer
    @StateObject var feedbackViewModel: FeedbackViewModel

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Transcript: ")
                    ScrollView {
                        Text(speechRecognizer.transcript)
                    }                        
                }
                VStack {
                    Text("Feedback: ")
                    ScrollView {
                        Text(feedbackViewModel.feedback)
                    }
                    .border(.white)
                    .padding(8)
                    .frame(minWidth: 700)
                    
                    Spacer()
                        
                }
                VStack {
                    Text("Practice: ")
                    ScrollView {
                        Text(feedbackViewModel.references)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationTitle("Feedback")
        .padding(16)
    }
}

#Preview {
    FeedbackView(speechRecognizer: SpeechRecognizer(), feedbackViewModel: FeedbackViewModel())
}
