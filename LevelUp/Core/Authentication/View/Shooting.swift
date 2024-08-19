//
//  Shooting.swift
//  demo
//
//  Created by Zeynep Göktepe on 8/10/23.
//

import SwiftUI
import AVKit
import AVFoundation
import Foundation
import Combine

struct Shooting: View {
    @Environment(\.colorScheme) var colorScheme
    
    let videoURLs = [
        "https://drive.google.com/file/d/1cNlBeI8bewHOD6waecCSGsz0dwv63_dR/preview",
        "https://drive.google.com/file/d/1qKPFC2UoRH9MGDoEx9nevbffksWdIIhs/preview",
        "https://drive.google.com/file/d/1AmhHvsC-Au0C4j7lFt0ILAqLsE8fwxG4/preview",
        "https://drive.google.com/file/d/1f3ZQv1B5JqMCLG_YW5rcLAWLk0H0Hzwk/preview",
        "https://drive.google.com/file/d/1to-6GAJ_KGJcbAZN4bKA2LbHkrw1uJV7/preview",
        "https://drive.google.com/file/d/1g0yU6kUW8QOUiRznNk5cU7H_84lp5Y5g/preview",
        "https://drive.google.com/file/d/10_sFf547BNZ2wmxLkheaagosoIH-mQCY/preview",
        "https://drive.google.com/file/d/1DTvGtxvxnbcAUkYJ4b87PD7V78S5TPbS/preview",
        "https://drive.google.com/file/d/1lMKqUw9TkqNB0-F3FJV5HJ3m66FYfxtE/preview",
        "https://drive.google.com/file/d/1QrfU_As27UcL03sGWJPanWw0JYyyLe8V/preview",
        
        
        
        "https://drive.google.com/file/d/14qbnYDkI6RCeM5siiF_PPscSjexJ91GE/preview",
        "https://drive.google.com/file/d/10hFlOUo0qrbu43IFFhXcfKIpI22RhYqk/preview",
        "https://drive.google.com/file/d/1OQxEiVskyJD6DpGJpd39l-MfHf5_dsQj/preview",
        "https://drive.google.com/file/d/1kLPDCAswLfJRIO8g7GqcigAcdOAIie4I/preview",
        "https://drive.google.com/file/d/1Da4-u79_6QBrOTv7W7JwS19-XCdfoPtw/preview",
        "https://drive.google.com/file/d/1JSvx6o8Qu1z-yj-s3fkfvKC4cmEj6vmE/preview",
        "https://drive.google.com/file/d/1cgBAxjQBsAC5BCbdVdkYzNtup-VkckL-/preview",
        "https://drive.google.com/file/d/1Vi4ovRIvGkWZO2CF_PyXx-2rvhIgoOrC/preview",
        "https://drive.google.com/file/d/19AIf27Xj0mQScytybOSSZm6dsfS8d9iz/preview",
        "https://drive.google.com/file/d/1X-D6cTGW_n8JGNbqpGutOqyo1RKUXkRQ/preview",
        
        
        
        "https://drive.google.com/file/d/1oFjhJvKLVS1nGPl0Xb1PGycbX7VeA3IF/preview",
        "https://drive.google.com/file/d/10Pzc-C390lX59dY6ekM7c_kMJKnWG1Au/preview",
        "https://drive.google.com/file/d/1haSrAFkIX0zM1J8Vh-bKJJfPDzFRHRSm/preview",
        "https://drive.google.com/file/d/1CGy1J-WB20ohVXeAoS4M7CAxpupjybb2/preview",
        "https://drive.google.com/file/d/1S8Z3h7fR5Y65mYiMY2sj6zZrrStXX8K1/preview",
        "https://drive.google.com/file/d/11Swrd0luKGTLt35MuVKUTUABqOllUxxL/preview",
        "https://drive.google.com/file/d/1MXKLVMB6CiMzUyWQGUWRpyKqR9gdZxlE/preview",
        "https://drive.google.com/file/d/1tklBkXQxxJ4J0lvXWfOOLJ1ZbSAu_x2X/preview",
        "https://drive.google.com/file/d/1FFYIFzzD2xvmOIefQ5Y84KI2DMsYFUqC/preview",
        "https://drive.google.com/file/d/1kHm1u7w4nZAYtIdeZIYAUOHBkiZCBHiL/preview",
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
                .navigationBarTitle("Shooting")
            }
        }
    }
}


struct Shooting_Previews: PreviewProvider {
    static var previews: some View {
        Shooting()
    }
}
