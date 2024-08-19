//
//  LevelUpApp.swift
//  LevelUp
//
//  Created by Zeynep Göktepe on 8/14/23.
//

import SwiftUI
import Firebase
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct LevelUpApp: App {
    
    
    @StateObject private var viewModel = AuthViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().environmentObject(viewModel)
            }
        }
    }
}
