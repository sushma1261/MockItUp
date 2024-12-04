//
//  RecordingView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 29/11/24.
//

/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI
import AVFoundation

struct RecordingView: View {
    @Binding var questionModel: QuestionModel
//    @StateObject var scrumTimer = ScrumTimer()
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    @StateObject var feedbackViewModel: FeedbackViewModel = FeedbackViewModel()
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Question")
                Text(questionModel.question)
                NavigationLink(destination: FeedbackView(speechRecognizer: speechRecognizer, feedbackViewModel: feedbackViewModel)) {
                    Label("Stop Recording", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                .onDisappear() {
                    Task {
                        do {
                            try await feedbackViewModel.getFeedbackFromLLM(transcript: "I'm particularly interested in the rise of micro frontends for scalable architecture, the use of WebAssembly to improve performance, and the growing adoption of AI-driven interfaces that enhance user experience through personalization. I’m also excited about serverless architectures for their scalability and cost-efficiency. To stay up-to-date, I actively follow industry-leading blogs, contribute to open-source projects, and participate in developer communities. I also explore new technologies through personal projects and leverage platforms like Udemy, LinkedIn Learning, and Kaggle to sharpen my skills, ensuring I’m always aligned with evolving industry standards.", question: questionModel.question)
                        } catch {
                            print(error)
                        }
                        }
                    endScrum()
                    print("test", speechRecognizer.transcript)
                }
                
            }
        }
        .padding()
        .onAppear {
            startScrum()
        }
        .onDisappear {
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func startScrum() {
//        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
//        scrumTimer.speakerChangedAction = {
//            player.seek(to: .zero)
//            player.play()
//        }
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        print("Speech transcript:::")
        print(speechRecognizer.transcript)
        isRecording = true
//        scrumTimer.startScrum()
    }
    
    private func endScrum() {
//        scrumTimer.stopScrum()
        speechRecognizer.stopTranscribing()
        isRecording = false
        let newHistory = AudioHistory(questionId: questionModel.id,
                                 transcript: speechRecognizer.transcript)
        questionModel.history.insert(newHistory, at: 0)
        print("End scrum", newHistory)
    }
}

struct RecordingView_Previews: PreviewProvider {
    static var previews: some View {
        RecordingView(questionModel: .constant(QuestionModel.sampleQuestionModel))
    }
}
