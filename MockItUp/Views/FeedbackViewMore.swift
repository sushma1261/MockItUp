//
//  FeedbackViewMore.swift
//  MockItUp
//
//  Created by Sushma Manthena on 05/12/24.
//

import SwiftUI

struct FeedbackViewMore: View {
    @State var feedback: String
    var body: some View {
        ScrollView {
            Text(feedback)
        }
        .padding(8)
    }
}

#Preview {
    FeedbackViewMore(feedback: "")
}
