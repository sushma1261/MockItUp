//
//  FeedbackView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct FeedbackView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Text("Feedback: ")
                    Text("Feedback text goes here")
                    Spacer()
                        
                }
                VStack {
                    Text("References: ")
                    Text("Feedback text goes here")
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
    FeedbackView()
}
