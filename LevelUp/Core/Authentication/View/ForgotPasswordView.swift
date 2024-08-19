//
//  ForgotPasswordView.swift
//  LevelUp
//
//  Created by Zeynep Göktepe on 8/27/23.
//

import SwiftUI
import Firebase

struct ForgotPasswordView: View {
    @State private var email = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                Button("Reset Password", action: resetPassword)
                    .disabled(email.isEmpty || !email.contains("@"))
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                Spacer() // Add some spacing
                
                // Back button
                NavigationLink(destination: LogInView()) {
                    Text("Back to Login")
                        .foregroundColor(Color.blue)
                        .padding()
                        
                }
                
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Password Reset"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            .navigationBarTitle("Forgot Password")
            
        }
        
    }
        
    func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                alertMessage = error.localizedDescription
            } else {
                alertMessage = "A password reset email has been sent."
            }
            showAlert = true
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
            
    }
}
