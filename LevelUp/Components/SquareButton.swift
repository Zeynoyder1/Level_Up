//
//  SquareButton.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI

struct SquareButton: View {
    let imageName: String
    let caption: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
                .cornerRadius(70)
                .shadow(radius:15)
                
                
            
            Text(caption)
                .font(.headline)
                .foregroundColor(.black)
        }
    }
}
