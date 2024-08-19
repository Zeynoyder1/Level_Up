//
//  WorkoutsView.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//
import SwiftUI

struct WorkoutsView: View {
    var body: some View {
        
        
        
        NavigationView {
            ZStack {
                Color.white
                VStack {
                    
                    Text("Workouts")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding()
                    
                  
                        HStack(spacing: 20) {
                            NavigationLink(destination: Ballhandling()) {
                                SquareButton(imageName: "PictureBallhandling", caption: "Ballhandling")
                            }
                            
                            NavigationLink(destination: Shooting()) {
                                SquareButton(imageName: "PictureShooting", caption: "Shooting")
                            }
                        }
                        
                        HStack(spacing: 20) {
                            NavigationLink(destination: Around_The_Hoop()) {
                                SquareButton(imageName: "PictureAroundtheHoop", caption: "Around The Hoop")
                            }
                            
                            NavigationLink(destination: Footwork()) {
                                SquareButton(imageName: "PictureConditioning", caption: "Conditioning")
                            }
                        }
                        
                        HStack(spacing: 20) {
                            NavigationLink(destination: Dribbling()) {
                                SquareButton(imageName: "PictureDribbling", caption: "Dribbling")
                            }
                            
                            NavigationLink(destination: Moves()) {
                                SquareButton(imageName: "PictureMoves", caption: "Moves")
                            }
                        }
                    }
                
                .padding()
               
                }
            }
        .frame(maxWidth: .infinity)
            .navigationBarHidden(true)
            .ignoresSafeArea()
            
        }
    }


struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}

// Define your SquareButton and other custom views here
