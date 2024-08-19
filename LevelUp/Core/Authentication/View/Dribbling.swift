//
//  Dribbling.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI
import AVFoundation
import Foundation
import Combine

struct Dribbling: View {
    @Environment(\.colorScheme) var colorScheme
    
    let videoURLs = [
        "https://drive.google.com/file/d/1LcX6FJjkpXlUvMe5NqNLk6lQ4NTarPD5/preview",
        "https://drive.google.com/file/d/1puZ4rw9AXkYIWv6qbRuM7gkwfNrW5sRD/preview",
        "https://drive.google.com/file/d/11Vqr7_ZCYuyqyAOJALxSug5jqaw1iPbb/preview",
        "https://drive.google.com/file/d/1CGy4c-B-EYQuUJwJRUoniHDfZ7gB2SAt/preview",
        "https://drive.google.com/file/d/13tKSacSBVo8TNDWd2pTOka_jq97HHIFp/preview",
        "https://drive.google.com/file/d/1lXGUk8JiNAWlImShmSWVQUm8JwAYuoUB/preview",
        "https://drive.google.com/file/d/1rBdWp3TRYNDSGrb1eVuj_RuM_Sga31Sk/preview",
        "https://drive.google.com/file/d/1RiBSihUyYgbX7Du4MdcRw1Pfp5Xi201p/preview",
        "https://drive.google.com/file/d/1hhn-M1rM_SidKvl_12IbyDmrLKak4qhU/preview",
        "https://drive.google.com/file/d/1ur38d1RmkK8SULi1kTQHNnLwNBwtSU3w/preview",
        
        
        
        "https://drive.google.com/file/d/16Tt8-Wd4iLJlQgK49kQqKmTB1Xn7t0eC/preview",
        "https://drive.google.com/file/d/1Aet0tiR1D_ZfU7hnITAsmJnmM68udCYk/preview",
        "https://drive.google.com/file/d/1Zn0PhbTFDihOdYLBiD2YqvO34Qd3LSBg/preview",
        "https://drive.google.com/file/d/1KnNMaCFvl2ByO1FvaDC0cGvBelkTcEjs/preview",
        "https://drive.google.com/file/d/1kv9I5VdIpcpmLmahe4gyJT-2jNUymvyb/preview",
        "https://drive.google.com/file/d/11iidz55_88uD934K4MnjyS46G4ItThdI/preview",
        "https://drive.google.com/file/d/1Nqyjp1Og-nvFRGL8eL9kJZaLfNRmENSu/preview",
        "https://drive.google.com/file/d/1Fa9l4WXjbeKlmlbomRP8gQpR5FBMeU8M/preview",
        "https://drive.google.com/file/d/1vv6cjbtf9EAIi7Zs55oxprLQW-cCvfxe/preview",
        "https://drive.google.com/file/d/1OuscFXLj8Je6XavKAIpevJdvuwaovsbT/preview",
        
        
        
        "https://drive.google.com/file/d/1ozvhi28z3cTZPlyOHBIpEm_5zn079z8m/preview",
        "https://drive.google.com/file/d/16_DJfHEEcavsForlsmZpLkfpc9W36R-b/preview",
        "https://drive.google.com/file/d/1Z4eTzlrBNNBD5lsCu9KHumJe5-LAksSN/preview",
        "https://drive.google.com/file/d/1hYGtGJa9IWKvURw4BhKun5tz6WJ3hPP2/preview",
        "https://drive.google.com/file/d/1rpFXB0DQUvUKVJdt45LX4kKvDLnl9DkO/preview",
        "https://drive.google.com/file/d/16FpYCb_A4luhyaYGgUgVAmA9dwLXcI4P/preview",
        "https://drive.google.com/file/d/1byhef9iLQn-FJ2sf0b7wSY-EJoZgWy1_/preview",
        "https://drive.google.com/file/d/107tqaWtFw3yGp3KVLm05dwwJGZe2KA_K/preview",
        "https://drive.google.com/file/d/1pxeL0bHNsmWabHQvlfAoqAbmx8I_xjYk/preview",
        "https://drive.google.com/file/d/1EjB_lVre3QC6eHFBZKT5nVMeA9FMTp1k/preview",
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
                .navigationBarTitle("Dribbling")
            }
        }
    }
}

struct Dribbling_Previews: PreviewProvider {
    static var previews: some View {
        Dribbling()
    }
}
