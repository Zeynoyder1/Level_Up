//
//  HomeView.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color(.white)
                .edgesIgnoringSafeArea(.all)
            
            if let user = viewModel.currentUser {
                VStack {
                    Spacer()
                    
                    Image("Picture2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 240, height: 280) // Adjust the size for iPad
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                        .shadow(radius: 10)
                        .padding(.bottom, 20)
                        .scaleEffect(isAnimating ? 1.0 : 0.5)
                    
                    VStack(spacing: 10) {
                        Text("Welcome")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Text(user.fullname)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .onAppear {
                    withAnimation(.spring()) {
                        isAnimating = true
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthViewModel())
    }
}
