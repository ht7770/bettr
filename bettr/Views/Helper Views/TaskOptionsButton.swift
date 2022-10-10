//
//  TaskOptionsButton.swift
//  bettr
//
//  Created by Henry Thomas on 10/10/2022.
//

import SwiftUI

struct TaskOptionsButton: View {
    var body: some View {
            Menu{
                Button {
                    print("Show Health Tasks")
                } label: {
                    Label("Show Health Tasks", systemImage: "heart.fill")
                }

                Button {
                    print("Show Work Tasks")
                } label: {
                    Label("Show Work Tasks ", systemImage: "briefcase.fill")
                }
                
                Button {
                    print("Show Learning Tasks")
                } label: {
                    Label("Show Learning Tasks ", systemImage: "book.fill")
                }
            } label: {
                Image(systemName: "ellipsis.circle").foregroundColor(.white)
                    
            }
    }
}

struct TaskOptionsButton_Previews: PreviewProvider {
    static var previews: some View {
        TaskOptionsButton()
    }
}
