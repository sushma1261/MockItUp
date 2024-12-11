//
//  SignInView.swift
//  MockItUp
//
//  Created by Sushma Manthena on 19/10/24.
//

import SwiftUI

struct SignInView: View {
    @State var username = "sushma"
    @State var password = "pass"
    @Binding var audios: [QuestionModel]
    @ObservedObject var preference: PreferencesViewModel = PreferencesViewModel()
    let saveAction: ()->Void
//    @State var error = ""
    var body: some View {
        
        NavigationStack {
            Text("MockItUp")
                .font(.system(size: 28))
                .bold()
            Spacer()
            
            VStack {
                Text("Sign In")
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
    //            Text(error)
                NavigationLink(destination: MainView(audios: $audios, saveAction: saveAction)) {
                    Text("Submit")
                }
                
            }
            Spacer()
        }
        .padding(16)
        Spacer()
    }
}


#Preview {
    NavigationStack {
        SignInView( audios: .constant(QuestionModel.sampleData), saveAction: {})
    }
}
