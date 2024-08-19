//
//  AroundTheHoop.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI
import AVKit
import AVFoundation
import Foundation
import Combine

struct Around_The_Hoop: View {
    @Environment(\.colorScheme) var colorScheme
    
    let videoURLs = [
        "https://drive.google.com/file/d/1VTVzFNivjy8BdaHByvTWc7N6UVp5Xim2/preview",
        "https://drive.google.com/file/d/1-gmMHAYsu-VejZtsgMipmYGp3Ru_9Rqe/preview",
        "https://drive.google.com/file/d/1tuPn6Bm-r_p3VBA_zZrwFMYV4f4HWpN3/preview",
        "https://drive.google.com/file/d/1W5W5WzWQj1ucKwbFGSbir6lmqBIDkvxB/preview",
        "https://drive.google.com/file/d/1fv_1sFLpzW3L1SmRFBrC1OQeUcs0Nrf9/preview",
        "https://drive.google.com/file/d/1vSYkQlklabM12DvyfFeQ6ZeeYhAJrHJT/preview",
        "https://drive.google.com/file/d/1Uagpm8JKXAZMKc3yd1GMzzvGGI3OT19e/preview",
        "https://drive.google.com/file/d/1E7fuF3lWcD5h8TXjyixWjnyy4nG2FBkI/preview",
        "https://drive.google.com/file/d/1lJD5ps7WXq339KdCazf0eyu46JYEToiR/preview",
        "https://drive.google.com/file/d/1QIDEjATZIm8TdSptNz2dxZKKgaKMSM7A/preview",
        
        
        
        "https://drive.google.com/file/d/1B197kRBIXUkdikXaaWMBgrfjyaRG7FB-/preview",
        "https://drive.google.com/file/d/1z7V5msoBCjiHM5RT_ncfWXSclRyHaGxQ/preview",
        "https://drive.google.com/file/d/1nyYQCDO3-2l5TU66nG4eHb-kkNqaVvhG/preview",
        "https://drive.google.com/file/d/13oWLq4JSYxdaNX3OUSrrCU-rPOAZXTL1/preview",
        "https://drive.google.com/file/d/1c20S9KBmFcSXLHgLTvBaACtT87MWjku7/preview",
        "https://drive.google.com/file/d/1fCWiJ0vneLv5MgB8h8IVP6uuae1NXvUa/preview",
        "https://drive.google.com/file/d/13i2_kxSI994W260F1lafp-eIjCKQ7wqX/preview",
        "https://drive.google.com/file/d/1fOTeYHHCLz4Qhd70CMvSqfMvYtNtSgyN/preview",
        "https://drive.google.com/file/d/1PK5SmvIYBIcePI3znx33hbfZkAhKJPWw/preview",
        "https://drive.google.com/file/d/1IIdJNRmOe06C85It1BquC5BCpxhKowaO/preview",
        
        
        
        "https://drive.google.com/file/d/1qH5QdkqJFGhDd5k2Y1fKihxR8wunAGfr/preview",
        "https://drive.google.com/file/d/1StAqvhYw3rYsQTExJxi9lGUzi8kGWNyk/preview",
        "https://drive.google.com/file/d/1p0bsDwbxuw6RLu0CAi3C2mrkN3BiG7Dl/preview",
        "https://drive.google.com/file/d/1h42UuQqQE2S7wB3D7bbKripnKG20f_xa/preview",
        "https://drive.google.com/file/d/1sPIQwfSf9mLnWVPcldp_s3ZqYdHwTbGi/preview",
        "https://drive.google.com/file/d/1sV-b9PBJK9r9TtM38txRzjdx_awZntYG/preview",
        "https://drive.google.com/file/d/1p1V1APuWOb70cdzQKIvkd10XexbiR7w4/preview",
        "https://drive.google.com/file/d/18MZTMSjTf_YhjaAQtPgkBjH-JbLLmOKl/preview",
        "https://drive.google.com/file/d/1BW77EUAAbsbHRQsuIzmidjqRW_YK6wm3/preview",
        "https://drive.google.com/file/d/1Rw44rE8kTrlB2VVPJOAY_u4a9J4t3JIu/preview",
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
                                .padding(.top, 10)
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
                .navigationBarTitle("Around The Hoop")
            }
        }
    }
}


struct Around_The_Hoop_Previews: PreviewProvider {
    static var previews: some View {
        Around_The_Hoop()
    }
}
