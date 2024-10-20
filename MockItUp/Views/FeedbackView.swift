//
//  FeedbackView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct FeedbackView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Feedback")
                Spacer()
                Text("Feedback text goes here")
                    .frame(height: 200)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Spacer()
                    
            }
            HStack {
                Text("References")
                Spacer()
                Text("Feedback text goes here")
                    .frame(height: 200)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    FeedbackView()
}
