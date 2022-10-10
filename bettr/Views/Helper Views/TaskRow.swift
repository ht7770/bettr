//
//  TaskRow.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import SwiftUI

struct TaskRow: View {
    @EnvironmentObject var taskModelData: TaskModelData
    
    @State private var showPopover: Bool = false
    
    var task: Task
    
    var taskIndex: Int {
        
        if (taskModelData.tasks.firstIndex(where: { $0.id == task.id})) == nil{
            return 0
        } else {
            return taskModelData.tasks.firstIndex(where: { $0.id == task.id})!
        }
    }
    
    var body: some View {
        HStack {
            Button(action: editTask){
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
            //.popover(isPresented: $showPopover){
            //    if !taskModelData.tasks.isEmpty{
            //        EditTaskPopover(showPopover: $showPopover, taskIndex: taskIndex)
            //    }
           // }
            Spacer()
            
            if !taskModelData.tasks.isEmpty{
                CompleteToggleButton(isComplete: $taskModelData.tasks[taskIndex].state)
            }
        }
    }
    
    func editTask(){
        print("edit task button pressed")
        showPopover = true
    }
}

