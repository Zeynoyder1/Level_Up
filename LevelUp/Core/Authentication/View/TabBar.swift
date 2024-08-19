//
//  TabBar.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            WorkoutsView()
                .tabItem {
                    Label("Workouts", systemImage: "basketball.fill")
                }
            
          ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

