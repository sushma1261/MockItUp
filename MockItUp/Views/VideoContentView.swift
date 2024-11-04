//
//  VideoContentView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/10/24.
//

import SwiftUI

struct VideoContentView: View {
    @StateObject var viewModel = VideoContentViewModel()
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        HStack {
            Text("Test")
            viewModel.preview?
                .frame(minWidth: 20, maxWidth: .infinity, minHeight: 20, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    print(oldPhase, newPhase)
                        switch newPhase {
                        case .active:
                            print("Active")
                            // Need to resume recording here if it is going from inactive to active
                            break
                        case .inactive:
                            print("Inactive")
                            // Need to stop recording here
                            break
                        case .background:
                            print("Moved to background")
                            // Need to stop recording here
                            break
                        @unknown default:
                            fatalError("The app has entered an unknown state.")
                        }
                    }
        }
        
        
    }
}

#Preview {
    VideoContentView()
}
