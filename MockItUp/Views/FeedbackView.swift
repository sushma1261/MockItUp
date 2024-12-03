//
//  FeedbackView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct FeedbackView: View {
    @State var speechRecognizer: SpeechRecognizer
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Transcript: ")
                    Text(speechRecognizer.transcript)
                    Spacer()
                        
                }
                VStack {
//                    Text("Feedback: ")
                    Text("You communicate with confidence and clarity, engaging well with others. To enhance effectiveness, focus on active listening and structuring your responses to improve flow and clarity. Engaging the audience with check-ins or clarifying questions can create a more interactive experience. These adjustments will further strengthen your communication impact.")
                    Spacer()
                        
                }
                VStack {
                    Text("Practice: ")
                    Text("1. TED Talks: Watching TED Talks and analyzing speakers' techniques can offer insights into effective communication, body language, and audience engagement. Try summarizing a talk to practice clarity.")
                    Text("2. Practicing with Peers: Engage in structured peer-to-peer feedback, recording yourself if possible to refine delivery and flow.")
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
    FeedbackView(speechRecognizer: SpeechRecognizer())
}
