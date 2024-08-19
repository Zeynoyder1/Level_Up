//
//  Moves.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI
import AVKit
import AVFoundation
import Foundation
import Combine

struct Moves: View {
    @Environment(\.colorScheme) var colorScheme
    
    let videoURLs = [
        "https://drive.google.com/file/d/17r2TZe-7cwmSLTBlOmxuYBylwZgZACbC/preview",
        "https://drive.google.com/file/d/1bRA6EGCzNJVOCzyyjr9ZNwAx5Yr2Xe5u/preview",
        "https://drive.google.com/file/d/16pnV_L1gFI2BCfcj1toTggrtFQ1SBa4A/preview",
        "https://drive.google.com/file/d/1yuckxcf2EY8LwVX8_ebQQzPXwj8IWfUf/preview",
        "https://drive.google.com/file/d/1gfn8mK8QADAwy2J9nUox-7Nqewqm3ldn/preview",
        "https://drive.google.com/file/d/1xWAVQsRiEnj4bwZ-Z5e0-HpWqWCEsTRG/preview",
        "https://drive.google.com/file/d/1yPGcjil3XzqcG7txeGhrGWFuBD88ilIT/preview",
        "https://drive.google.com/file/d/100YJiny3TCLHIrwgsXUV4XZVBbUoVkka/preview",
        "https://drive.google.com/file/d/1tWJpyDeFoK_GQnfa4Tbdb8XNpXWxom7U/preview",
        "https://drive.google.com/file/d/1qr46TxGVeVlSf8uQARKiSGbgjrV0LfXR/preview",
        
        
        
        "https://drive.google.com/file/d/1-Gir1K0su8_BwuJgpqxAr9jJ7cVtnOa4/preview",
        "https://drive.google.com/file/d/18GRi2ylXgX_YOeFMidCzSIgXumEBSNRB/preview",
        "https://drive.google.com/file/d/1Oq4_dP3eKjhZnSKOOq1IvZxgnmYmhxsZ/preview",
        "https://drive.google.com/file/d/1Gh7euf1DPJl96LH8YeXa4ZGehHGzX8qs/preview",
        "https://drive.google.com/file/d/1gFPg0gbWXCWGjfttHZAWX_oB3Q6KZKB9/preview",
        "https://drive.google.com/file/d/1-vxNunwagio9WKNU5huyZv1E-3Fn9OCG/preview",
        "https://drive.google.com/file/d/1oxKGkrHMn9c2XzOFDvxVXBipQmQcK5Eq/preview",
        "https://drive.google.com/file/d/1yyUt3VBUOC7dFLQNWY8YMnLJ7UDDelEO/preview",
        "https://drive.google.com/file/d/10Y2m2lAcdTnvZgVwANfwd2eXGyd-oB1x/preview",
        "https://drive.google.com/file/d/1363LgpVZjIROtjUvFGqOtv1yGB8Xadno/preview",
        
        
        
        "https://drive.google.com/file/d/1K1zEEs_d4MpMZoouSFv3WYaIjPXFwOjr/preview",
        "https://drive.google.com/file/d/18CRXEfqHjS0sQ6-6y8biho-NTZwcejy2/preview",
        "https://drive.google.com/file/d/1sdDLnrnfPOMt3HyiveGcCrSePEZDLhMq/preview",
        "https://drive.google.com/file/d/1BBsNAsuE8fH0MaFXqkYI0gM1I-snfLkE/preview",
        "https://drive.google.com/file/d/1I0KoEQb0O5hVHOulK_AgX7B8VovEBWO_/preview",
        "https://drive.google.com/file/d/197kuNWUElyVuVo_yagybobeR0-9wu0em/preview",
        "https://drive.google.com/file/d/1xfa8IW7cypDJug8TQcXioiQXlIvBBWoe/preview",
        "https://drive.google.com/file/d/1Ol03dZUkQ1SqCG-iXKADqkgUyS5mwQel/preview",
        "https://drive.google.com/file/d/1vgrp07ne5yaJnoy9B47NZnA_ilP3ggDA/preview",
        "https://drive.google.com/file/d/1afi3Nc36DOrBVS3eQUY2LB6i36rzLL1y/preview",
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
                .navigationBarTitle("Moves")
            }
        }
    }
}


struct Moves_Previews: PreviewProvider {
    static var previews: some View {
        Moves()
    }
}
