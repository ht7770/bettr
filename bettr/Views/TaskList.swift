//
//  TaskList.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import SwiftUI

struct TaskList: View {
    var body: some View {
        NavigationView {
            List(tasks) { task in
                NavigationLink {
                    TaskDetail()
                } label: {
                    TaskRow(task: task)
                }
            }
            .scrollContentBackground(.hidden)
            .background(backgroundColour())
            .navigationTitle("Today's Tasks")
        }
    }
}
struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
