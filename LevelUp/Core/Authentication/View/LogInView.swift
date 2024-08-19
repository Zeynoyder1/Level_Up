//
//  LogInView.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI


struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }

    var body: some View {
        NavigationStack{
            
                VStack{
                    
                    Image("Picture2")
                        .resizable()
                        .scaledToFill()
                        .frame(width:150, height:180)
                    
                    VStack (spacing: 24) {
                        InputView(text: $email,
                                  title: "Email Adress",
                                  placeholder: "name@example.com")
                        .autocapitalization(.none)
                        
                        
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder: "Enter your password",
                                  isSecureField: true)
                      
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    .foregroundColor(.black)
                    
                    
                    NavigationLink {
                        ForgotPasswordView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Forgot Password?")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .font(.system(size: 14))
                        .foregroundColor(Color(.systemBlue))
                    }
                   
                    Button {
                        Task {
                            try await viewModel.signIn(withEmail: email,
                                                       password: password)
                        }
                    }label: {
                        HStack {
                            Text("SIGN IN")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.systemOrange))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .cornerRadius(10)
                    .padding(.top, 24)
                    
                    Spacer()
                    
                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.bold)
                        }
                        .font(.system(size: 14))
                        .foregroundColor(Color(.systemBlue))
                    }
                   
                    
                    
                    
                }
                .padding()
                .background(Color.white)
                .navigationBarBackButtonHidden()
            }
        }
     
    
    
    struct LogInView_Previews: PreviewProvider {
        static var previews: some View {
            LogInView()
                .navigationBarBackButtonHidden()
        }
    }
    
    
    
}

