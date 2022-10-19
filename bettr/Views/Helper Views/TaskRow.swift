//
//  TaskRow.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import SwiftUI

struct TaskRow: View {
    @EnvironmentObject var taskModelData: TaskModelData
    
    @State private var expandTask: Bool = false
    
    var task: Task
    
    var taskIndex: Int {
        
        if (taskModelData.tasks.firstIndex(where: { $0.id == task.id})) == nil{
            return 0
        } else {
            return taskModelData.tasks.firstIndex(where: { $0.id == task.id})!
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Button(action: withAnimation {editTask}){
                    HStack {
                        task.image
                            .font(.system(size: 20))
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .bold()
                            
                            HStack {
                                Text(task.getState())
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        }
                    }
                }
                .opacity(getTaskState() ? 0.3 : 1.0)
                Spacer()
                
                if !taskModelData.tasks.isEmpty{
                    CompleteToggleButton(isComplete: $taskModelData.tasks[taskIndex].state)
                }
            }
            if expandTask {
                Divider()
                Text(task.description)
                    .font(.subheadline)
                    .opacity(getTaskState() ? 0.3 : 1.0)
            }
    
            
        }
    
    }
    
    
    func editTask(){
        print("show task button pressed")
        expandTask.toggle()
    }
    
    func getTaskState() -> Bool{
        var state = true
        if !taskModelData.tasks.isEmpty{
            state = taskModelData.tasks[taskIndex].state
        }
        return state
    }
}

