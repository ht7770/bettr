//
//  TaskOptionsButton.swift
//  bettr
//
//  Created by Henry Thomas on 10/10/2022.
//

import SwiftUI

struct TaskOptionsButton: View {
    
    @Binding var filterHealthTasks: Bool
    @Binding var filterWorkTasks: Bool
    @Binding var filterLearningTasks: Bool
    
    
    var body: some View {
            Menu{
                Button(action: {filterHealthTasks.toggle()}){
                label: do {
                    switch filterHealthTasks {
                    case true:
                        Label("Hide Health Tasks", systemImage: "heart.fill")
                        
                    default:
                        Label("Show Health Tasks", systemImage: "heart")
                        
                    }
                }
                }
                
                Button(action: {filterWorkTasks.toggle()}){
                label: do {
                    switch filterWorkTasks {
                    case true:
                        Label("Hide Work Tasks", systemImage: "briefcase.fill")
                        
                    default:
                        Label("Show Work Tasks", systemImage: "briefcase")
                        
                    }
                }
                }
                
                Button(action: {filterLearningTasks.toggle()}){
                label: do {
                    switch filterLearningTasks {
                    case true:
                        Label("Hide Learning Tasks", systemImage: "book.fill")
                        
                    default:
                        Label("Show Learning Tasks", systemImage: "book")
                        
                    }
                }
                }

            } label: {
                Image(systemName: "ellipsis.circle").foregroundColor(.white)
                    
            }
    }
}

