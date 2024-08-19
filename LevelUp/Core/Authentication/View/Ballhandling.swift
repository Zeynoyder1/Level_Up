//
//  Ballhandling.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import AVKit
import SwiftUI
import AVFoundation
import Foundation
import Combine

struct Ballhandling: View {
    @Environment(\.colorScheme) var colorScheme
    
    let videoURLs = [
        "https://drive.google.com/file/d/1bULm8zOqC7pZQBOZyZ1ehB2Nq8oxEXS2/preview",
        "https://drive.google.com/file/d/1tFjsX7euKNbJJwScJ8qXlGiiLVXz9j6H/preview",
        "https://drive.google.com/file/d/1aM1u-RATaMPYpYKHjr-X3zW_P8TE-KNo/preview",
        "https://drive.google.com/file/d/1Ix_SjzwOrtHp9sEdERgCtYVpcAKTFzdQ/preview",
        "https://drive.google.com/file/d/1nMVVlEeL8HVHnZeOvpLKd7mbIar_Nitr/preview",
        "https://drive.google.com/file/d/1YZhFValA0dcuVO1idpcedGBij0ZQRBpM/preview",
        "https://drive.google.com/file/d/1Wed3-ZjZWhVRSFEDjmYYMHDWuTq3X9DW/preview",
        "https://drive.google.com/file/d/1gna6sq-9pPqlGkFIzhkmC3v-XCAxb9b9/preview",
        "https://drive.google.com/file/d/1JBQoRF1iKW2QlTPhfQdojo1axkMftkM3/preview",
        "https://drive.google.com/file/d/1CN1sWlcpairJI3zjp4Ky753XAv-gk1NA/preview",

        
        "https://drive.google.com/file/d/1NMilBGa4F31xS4uoFDn9hmPvONOn5kTF/preview",
        "https://drive.google.com/file/d/1TZZ27Fd5wtOpQFUmK2zL0KONrF2BsNRH/preview",
        "https://drive.google.com/file/d/12cb0vA2j-QXMDaXaRcVkcwFS2p1qDohL/preview",
        "https://drive.google.com/file/d/1847irXWWY87P5btwdVf5tjA5GcB2qNK3/preview",
        "https://drive.google.com/file/d/1pxgRG3B3gbv1lPKaqF0MsTNF-8Noc30h/preview",
        "https://drive.google.com/file/d/1AP5S-Am_s6IGxI8fkLdRPJhHSyjz9Kbz/preview",
        "https://drive.google.com/file/d/15dQmnBI-ewZaEDg8g6L3_CZKdPhiB-WF/preview",
        "https://drive.google.com/file/d/1T8dAMaorjomhewK0lqWtJ-5FRGIb9lk9/preview",
        "https://drive.google.com/file/d/1nwVmBZJ7bjMT7cjTQamm0TnQ6GphRSmF/preview",
        "https://drive.google.com/file/d/16m0zloZl1HkPwUdONpuAoRfvUEOHSXg-/preview",
        
        
        
        "https://drive.google.com/file/d/19W7rMwJyabfgTNiLsFJwb2N2TtCcioz6/preview",
        "https://drive.google.com/file/d/1mCAYL_uvRdHF_7iYsD0Po9MvvhW0HyJT/preview",
        "https://drive.google.com/file/d/1e2Dv_Q0bPZYvW3Lc2f3ume9flVawEp9n/preview",
        "https://drive.google.com/file/d/1ZtJDlKF-vzRHlD64rmZBqe-LUanrgp-d/preview",
        "https://drive.google.com/file/d/1hj7I3mBURKpB_0ZjdtfG_kGV6hK03Rl4/preview",
        "https://drive.google.com/file/d/1w8w4EkWgKrunCA6NLcR3lhiIcWDHMEOG/preview",
        "https://drive.google.com/file/d/1sEgzqmqWsJo2mkuuhefl9i4P_sHCu2j8/preview",
        "https://drive.google.com/file/d/1rjuXy6Vv8EyfdXzPsjerUPHTeyYileiq/preview",
        "https://drive.google.com/file/d/1Y1wAh01Kqm5T2Hg0s4OcBHNHxw0lbWWo/preview",
        "https://drive.google.com/file/d/1jU2ZfErd3GacSIc1b4E9be_Se1_xyS1k/preview",
    ]
    
    let labels = ["Beginner", "Intermediate", "Advanced"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                VStack(alignment: .leading) {
                    Spacer()
                    ForEach(0..<videoURLs.count, id: \.self) { index in
                        if index % 10 == 0 && index / 10 < labels.count {
                            Text(labels[index / 10])
                                .font(.title)
                                
                        }
                        if index % 2 == 0 {
                            HStack {
                                VideoPageView(videoURL: URL(string: videoURLs[index])!)
                                    .frame(width: 180, height: 150)
                                    .cornerRadius(10)
                                    .padding(.trailing)
                                VideoPageView(videoURL: URL(string: videoURLs[index + 1])!)
                                    .frame(width: 180, height: 150)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    Spacer()
                }
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .padding([.top, .leading])
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .navigationBarTitle("Ballhandling")
            }
        }
    }
}

struct Ballhandling_Previews: PreviewProvider {
    static var previews: some View {
        Ballhandling()
    }
}

class PlayerManager: ObservableObject {
    @Published var currentVideoURL: URL?
}


struct player: UIViewControllerRepresentable {
    @EnvironmentObject var playerManager: PlayerManager
    let videoPath: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        
        let videoURL = URL(fileURLWithPath: videoPath)
        let player1 = AVPlayer(url: videoURL)
        controller.player = player1
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update your view controller here if needed
    }
    
    // Use onAppear to update the environment object outside the view update cycle
    func onAppear(perform action: @escaping () -> Void) -> some View {
        self.modifier(OnAppearModifier(perform: action))
    }
}

struct OnAppearModifier: ViewModifier {
    let perform: () -> Void
    
    func body(content: Content) -> some View {
        content.onAppear(perform: perform)
    }
}


