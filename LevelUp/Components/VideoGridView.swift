//
//  VideoGridView.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI
import AVKit
import AVFoundation

struct VideoGridView: View {
    @StateObject private var playerManager = PlayerManager()
    let videoPaths: [String]
    let videoSize: CGSize
    let videoCaptions: [String]
    
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0 ..< videoPaths.count / 2, id: \.self) { rowIndex in
                let startIndex = rowIndex * 2
                let endIndex = min(startIndex + 2, videoPaths.count)
                let rowVideoPaths = Array(videoPaths[startIndex ..< endIndex])
                
                HStack(spacing: 20) {
                    ForEach(rowVideoPaths.indices, id: \.self) { index in
                        VStack {
                            player(videoPath: rowVideoPaths[index])
                                .environmentObject(playerManager)
                                .cornerRadius(10)
                                .frame(width: videoSize.width, height: videoSize.height)
                            
                            Text(videoCaptions[index]) // Display the caption
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding(.top, 4)
                        }
                    }
                }
            }
        }
    }
}
