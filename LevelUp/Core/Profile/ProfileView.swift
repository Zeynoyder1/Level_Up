//
//  ProfileView.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isPresentingLogInView = false
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section(header: Text("Profile")) {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical)
                }
                
                Section(header: Text("General")) {
                    HStack {
                        SettingRowView(imageName: "gear",
                                       title: "Version",
                                       tintColor: Color(.systemGray))
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Section(header: Text("Account")) {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill",
                                       title: "Sign out",
                                       tintColor: .red)
                    }
                    
                    Button {
                        viewModel.deleteAccount { [weak viewModel] success, error in
                            if success {
                                viewModel?.shouldNavigateToLogIn = true
                                isPresentingLogInView = true
                            } else {
                                // Show error message
                            }
                        }
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill",
                                       title: "Delete Account",
                                       tintColor: .red)
                    }
                    .fullScreenCover(isPresented: $isPresentingLogInView) {
                        LogInView()
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarHidden(true)
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
