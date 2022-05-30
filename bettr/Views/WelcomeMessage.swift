//
//  WelcomeMessage.swift
//  bettr
//
//  Created by Henry Thomas on 02/01/2022.
//

import SwiftUI

struct WelcomeMessage: View {
    
    var name: String
    
    var body: some View {
        HStack {
            Text("Good Morning, \(name)")
                .padding()
                .font(.system(size:56, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            Spacer()
        }
    }
}

