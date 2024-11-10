//
//  VideoContentView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 27/10/24.
//

import SwiftUI

struct VideoContentView: View {
    @StateObject var viewModel = VideoContentViewModel()
    var body: some View {
        HStack {
            Text("Test")
            viewModel.preview?
                .frame(minWidth: 20, maxWidth: .infinity, minHeight: 20, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
//                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
    VideoContentView()
}
