//
//  SignIn.swift
//  MockItUp
//
//  Created by Sushma Manthena on 05/12/24.
//


import SwiftUI

struct SignIn: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @ObservedObject var preference: PreferencesViewModel = PreferencesViewModel()
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Username TextField
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                // Password SecureField
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                // Sign In Button
    //            Button(action: validateCredentials) {
    //                Text("Sign In")
    //                    .font(.headline)
    //                    .foregroundColor(.white)
    //                    .frame(maxWidth: .infinity)
    //                    .padding()
    //                    .background(Color.blue)
    //                    .cornerRadius(10)
    //            }
    //            .alert(isPresented: $showAlert) {
    //                Alert(title: Text("Sign-In Result"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
    //            }
                NavigationLink(destination: PreferrencesView(preference: preference)) {
                    Text("Submit")
                }

                Spacer()
            }
        }
        .padding()
    }

    // Validation Function
    func validateCredentials() {
        if password == "test123" {
            alertMessage = "Sign-In Successful!"
        } else {
            alertMessage = "Invalid Password! Please enter 'test123'."
        }
        showAlert = true
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
