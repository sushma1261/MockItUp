//
//  FeedbackView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct FeedbackView: View {
    @StateObject var feedbackViewModel: FeedbackViewModel

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Feedback: ")
                    NavigationLink(destination: FeedbackViewMore(feedback: feedbackViewModel.feedback)){
                        ScrollView {
                            Text(feedbackViewModel.feedback)
                        }
                    }
                    .padding(8)
                    Spacer()
                        
                }
                VStack {
                    Text("Practice: ")
                    NavigationLink(destination: FeedbackViewMore(feedback: feedbackViewModel.references)){
                        ScrollView {
                            Text(feedbackViewModel.references)
                        }
                    }
                    
                    Spacer()
                }
                Spacer()
            }
        }
        .padding(16)
    }
}

#Preview {
    FeedbackView(feedbackViewModel: FeedbackViewModel())
}
