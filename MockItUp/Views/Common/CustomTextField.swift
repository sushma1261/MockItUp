//
//  CustomTextField.swift
//  MockItUp
//
//  Created by Sushma Manthena on 26/10/24.
//

import SwiftUI

struct CustomTextField: View {
    @State var title: String
    @Binding var variable: String
    @State var styleType: String
    var body: some View {
        TextField(title, text: $variable)
            .keyboardType(.decimalPad)
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
    }
}

#Preview {
    CustomTextField(title: "Title", variable: .constant("default"), styleType: "style1")
}
