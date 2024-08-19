//
//  AuthViewModel.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI
import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore

protocol AuthenticationFormProtocol {
   var formIsValid: Bool { get }
}

@MainActor



class AuthViewModel: ObservableObject {
   @EnvironmentObject var viewModel: AuthViewModel
    @Published var userSession: Firebase.User?
   @Published var currentUser: User?
   @Published var shouldNavigateToLogIn = false
   

   
   init(){
       self.userSession = Auth.auth().currentUser
       Task {
           await fetchUser()
       }
   }
   
   func signIn(withEmail email: String, password: String) async throws {
       do {
           let result = try await Auth.auth().signIn(withEmail: email, password: password)
           self.userSession = result.user
           await fetchUser()
       } catch {
           print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
       }
   }
   
   func createUser(withEmail email: String, password: String, fullname: String) async throws {
       do {
           let result = try await Auth.auth().createUser(withEmail: email, password: password)
           self.userSession = result.user
           let user = User(id: result.user.uid, fullname: fullname, email: email)
           let encodedUser = try Firestore.Encoder().encode(user)
           try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
           await fetchUser()
           print("User created successfully!")
       } catch {
           print("DEBUG: Failed to create user with error \(error.localizedDescription)")
           
       }
   }
   
   
   func signOut(){
       do {
           try Auth.auth().signOut()
           self.userSession = nil
           self.currentUser = nil
       } catch {
           print("DEBUG: Failed to create user with error \(error.localizedDescription)")
       }
   }
   
   func deleteAccount(completion: @escaping (Bool, Error?) -> Void) {
       guard let user = Auth.auth().currentUser else {
           completion(false, NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not found"]))
           return
       }

       Task {
           do {
               // Step 1: Delete user data from Firestore (if applicable)
               try await Firestore.firestore().collection("users").document(user.uid).delete()
               
               // Step 2: Delete user from Firebase Authentication
               try await user.delete()
               
               // Step 3: Sign out the user
               try Auth.auth().signOut()
               
               completion(true, nil)
           } catch {
               print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
               completion(false, error)
           }
       }
   }



   
   func fetchUser() async {
       guard let uid = Auth.auth().currentUser?.uid else { return }
       do {
           let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
           self.currentUser = try? snapshot.data(as: User.self)
       } catch {
           print("DEBUG: Error fetching user - \(error.localizedDescription)")
       }
   }
   
   
 
}
