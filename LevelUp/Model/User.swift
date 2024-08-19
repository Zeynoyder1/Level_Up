//
//  User.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI
import Foundation
import FirebaseAuth

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
   
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}


