//
//  Footwork.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI
import AVKit
import AVFoundation
import Foundation
import Combine

struct Footwork: View {
    @Environment(\.colorScheme) var colorScheme
    
    let videoURLs = [
        "https://drive.google.com/file/d/10jaNYwSJlzoBYYwo-fH7hyzb7umTm87t/preview",
        "https://drive.google.com/file/d/1xKTkq2K3aSqf6JcYk-fD_XqCL8ivTgMD/preview",
        "https://drive.google.com/file/d/1t9vSeOwKgAKmVKNVZZt4ZwIo7zrsLxjX/preview",
        "https://drive.google.com/file/d/1mGQBazvxAxWGeH618IN7r5I9wkFLfD1k/preview",
        "https://drive.google.com/file/d/1-CABu2f7fM3jN7J3ZErTGMBeNEaK5xH8/preview",
        "https://drive.google.com/file/d/11wC--SoLL5VYgOkAHNCuCCSI5s1Q3pYB/preview",
        "https://drive.google.com/file/d/1wCJDBW7PM6RkKsWLgYbkctQAHssrex0U/preview",
        "https://drive.google.com/file/d/1HVD-nnk2P2BJjBKV9zseJO93shO28cZE/preview",
        "https://drive.google.com/file/d/1r2CBvS-GWOeI6fC2DQBFnGJQo0bXamVY/preview",
        "https://drive.google.com/file/d/19NHV1yA3SYcpaDAFjgpFiU-fl6AF71vA/preview",
        
        
        
        "https://drive.google.com/file/d/1PUSadEBTt9dA0cudoHgZ7zb2TAbF3qTa/preview",
        "https://drive.google.com/file/d/1nIDRlXhSqfRiCaSrDlcAw8NKlMh-9-VM/preview",
        "https://drive.google.com/file/d/12wzsZ7pltSAc8v8TCGBJCQUXCRqTMb2W/preview",
        "https://drive.google.com/file/d/1bgkCuIVmsVm3AYCzQbx-9EzkU_I9Pmpv/preview",
        "https://drive.google.com/file/d/1QHMv3iF5LVIwZVV5NTFHQBNjZdIYUQCf/preview",
        "https://drive.google.com/file/d/1guqxZzue1l1CJRY0qKL0gJlIlZxRdIMl/preview",
        "https://drive.google.com/file/d/18vV4-U99FWnomVSZkMEMn-utkXx9etZh/preview",
        "https://drive.google.com/file/d/1KHVhCG9I44_reBMXT6GzP5C4gWWKT5EN/preview",
        "https://drive.google.com/file/d/1sku3jzWMThZMcMQUEa0XZeetT2yivtWg/preview",
        "https://drive.google.com/file/d/1i6b1HkIW7dM60A0GLRP5HAvOVUl_6ENO/preview",
        
        
        
        "https://drive.google.com/file/d/1UWmZ_h9rmUbDLM0RyHrI4wJaPPR-g8-M/preview",
        "https://drive.google.com/file/d/1F6tvDRKLulXDtWEMLwX66yiEKhs9P8df/preview",
        "https://drive.google.com/file/d/1TaVDIg4n-4LnNtXVy9Am80qI324Doxtv/preview",
        "https://drive.google.com/file/d/1u-0Hf6Nu5KkMJDDFeNipL6vpLOYdOXeR/preview",
        "https://drive.google.com/file/d/1UJUu5jxXIfQibeZwGPG4Sn-5WSdjufvP/preview",
        "https://drive.google.com/file/d/1rPS_IWO-9Mwwm3KqUgEL4dkQojvkD00x/preview",
        "https://drive.google.com/file/d/16BFydgDyKABaN8ITbNdKpBXDBLmuOwbT/preview",
        "https://drive.google.com/file/d/1F3QuuETmfoefBDxfvRzpxuD2RCEB5pd3/preview",
        "https://drive.google.com/file/d/18Lz40JBPeIi31PVIslJRdPisOU_I6wcV/preview",
        "https://drive.google.com/file/d/1afyFcGtz3n-351KE7LOn0d_4VcKLd6qS/preview",
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
                .navigationBarTitle("Conditioning")
            }
        }
    }
}


struct Footwork_Previews: PreviewProvider {
    static var previews: some View {
        Footwork()
    }
}
