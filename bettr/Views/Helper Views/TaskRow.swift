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
        
        taskModelData.tasks.firstIndex(where: { $0.id == task.id})!
    }
    
    var body: some View {
        HStack {
            Button(action: editTask){
                HStack {
                    task.image
                        .resizable()
                        .offset(x: 10)
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading) {
                        Text(task.title)
                            .bold()
                        
                        HStack {
                            Text(task.getState())
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                    }
                    .offset(x: 10)
                }
            }
            Spacer()
            if !taskModelData.tasks.isEmpty{
                CompleteToggleButton(isComplete: $taskModelData.tasks[taskIndex].state)
            }
        }
    }
    
    func editTask(){
        print("edit task button pressed")
    }
}

