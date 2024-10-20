//
//  TabbedViewForStorageDemo.swift
//  MockItUp
//
//  Created by Sushma Manthena on 20/10/24.
//

import SwiftUI

struct TabbedViewForStorageDemo: View {
    @State var selection: String = ""
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack() {
                PreferrencesView()
                    .navigationTitle("Preferences")
            }
            .tabItem {
                Text("Preferences")
                Image(systemName: "gearshape")
                    .renderingMode(.template)
            }
            .tag(0)
            
            NavigationStack() {
                ImageDemoView()
            }
            .tabItem {
                Text("My Account")
                Image(systemName: "person.fill")
                    .renderingMode(.template)
            }
            .tag(1)
            
        }
    }
}

#Preview {
    TabbedViewForStorageDemo()
}
