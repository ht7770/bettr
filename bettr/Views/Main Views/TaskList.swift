//
//  TaskList.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import SwiftUI

struct TaskList: View {
    @EnvironmentObject var taskModelData: TaskModelData
    @State private var showTodoTasks = false
    
    var filteredTasks: [Task] {
        taskModelData.tasks.filter { task in
            (!showTodoTasks || !task.state)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                
                Toggle(isOn: $showTodoTasks) {
                    Text("Hide finished tasks")
                    
                }

                ForEach(filteredTasks, id:\.self) { task in
                        TaskRow(task: task)
                }
                .onDelete(perform: taskModelData.removeTask(at:))
    
            }
            .navigationBarItems(trailing: addTaskButton())
            .navigationTitle("Today's Tasks")
            .scrollContentBackground(.hidden)
            .background(backgroundColour())
            
            
        }
        
    }
}
struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
            .environmentObject(TaskModelData())
    }
}
