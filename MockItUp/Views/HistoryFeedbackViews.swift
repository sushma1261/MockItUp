//
//  HistoryFeedbackViews.swift
//  MockItUp
//
//  Created by Sushma Manthena on 05/12/24.
//

import SwiftUI

struct HistoryFeedbackViews: View {
    @Binding var history: [AudioHistory]
//    let formatter = DateFormatter()
//            formatter.dateStyle = .medium
//            formatter.timeStyle = .short
    var body: some View {
        
            Text("History: " + String(history.count))
            List {
                ForEach(history) { historyItem in
                    NavigationLink(destination: FeedbackHistoryView(historyItem: historyItem)) {
                        Text(historyItem.date, style: .time)
                            .safeAreaPadding(8)
                    }
                    
                }
                .onAppear {
                            Task {
                                print("History:::")
                                print(history)
                            }
                        }
//                Spacer()
            }
        
        
    }
}

#Preview {
    HistoryFeedbackViews(history: .constant([]))
}
