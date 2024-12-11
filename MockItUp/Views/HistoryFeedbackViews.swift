//
//  HistoryFeedbackViews.swift
//  MockItUp
//
//  Created by Sushma Manthena on 05/12/24.
//

import SwiftUI

struct HistoryFeedbackViews: View {
    @Binding var history: [AudioHistory]
    var body: some View {
        VStack {
                Text("History:")
                List {
                    ForEach(history) { historyItem in
                        NavigationLink(destination: FeedbackHistoryView(historyItem: historyItem)) {
                            Text(historyItem.date, style: .time)
                        }
                        
                    }
                }
            }
        
    }
}

#Preview {
    HistoryFeedbackViews(history: .constant([]))
}
