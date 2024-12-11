//
//  FeedbackHistoryView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 05/12/24.
//

import SwiftUI

struct FeedbackHistoryView: View {
    @State var historyItem: AudioHistory
    var body: some View {
        VStack {
            VStack {
                Text("Feedback: ")
                NavigationLink(destination: FeedbackViewMore(feedback: historyItem.feedback ?? "No feedback found!!")){
                    ScrollView {
                        Text(historyItem.feedback ?? "No feedback found!!")
                    }
                }
                .padding(8)
                Spacer()
                    
            }
            VStack {
                Text("Practice: ")
                NavigationLink(destination: FeedbackViewMore(feedback: historyItem.references ?? "No feedback found!!")){
                    ScrollView {
                        Text(historyItem.references ?? "No feedback found!!")
                    }
                }
                
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    FeedbackHistoryView(historyItem: AudioHistory.sampleData)
}
