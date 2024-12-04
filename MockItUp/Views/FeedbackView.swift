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
                    Text(speechRecognizer.transcript)
                    Spacer()
                        
                }
                VStack {
                    Text("Feedback: ")
                    Text(feedbackViewModel.feedback)
                    Spacer()
                        
                }
                VStack {
                    Text("Practice: ")
//                    Text("1. TED Talks: Watching TED Talks and analyzing speakers' techniques can offer insights into effective communication, body language, and audience engagement. Try summarizing a talk to practice clarity.")
//                    Text("2. Practicing with Peers: Engage in structured peer-to-peer feedback, recording yourself if possible to refine delivery and flow.")
                    Text(feedbackViewModel.references)
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
