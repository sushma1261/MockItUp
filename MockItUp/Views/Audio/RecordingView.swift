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
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Transcript")
                Text(speechRecognizer.transcript)
                NavigationLink(destination: FeedbackView(speechRecognizer: speechRecognizer)) {
                    Label("Stop Recording", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                .onDisappear() {
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
