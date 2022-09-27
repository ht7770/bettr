//
//  TaskDetail.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import SwiftUI

struct TaskDetail: View {
    
    @EnvironmentObject var taskModelData: TaskModelData
    var task: Task
    
    var taskIndex: Int {
        taskModelData.tasks.firstIndex(where: { $0.id == task.id})!
    }
    
    var body: some View {
        Text("Task Detail Page!")
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static let taskModelData = TaskModelData()
    static var previews: some View {
        TaskDetail(task: taskModelData.tasks[0])
            .environmentObject(taskModelData)
    }
}
