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
    
    @State private var showHealthTasks = true
    @State private var showWorkTasks = true
    @State private var showLearningTasks = true
    
    var categoryFiltered: [Task] {
        taskModelData.tasks.filter { task in
            let categoryType = task.taskCategory.rawValue
            switch (categoryType) {
            case "heart.fill":
                if showHealthTasks{
                    return true
                }
                else{
                    return false
                }
                
            case "briefcase.fill":
                if showWorkTasks{
                    return true
                }
                else{
                    return false
                }
                
            case "book.fill":
                if showLearningTasks{
                    return true
                }
                else{
                    return false
                }
                
            default:
                return false
            }
        }
    }
    
    var completedFilteredTasks: [Task] {
        categoryFiltered.filter { task in
            (!showTodoTasks || !task.state)
        }
    }
    
    var todaysTasks: [Task]{
        completedFilteredTasks.filter { task in
            task.dateState
        }
    }
    
    var tomorrowsTasks: [Task]{
        completedFilteredTasks.filter { task in
            !task.dateState
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            List{
                
                Toggle(isOn: $showTodoTasks) {
                    Text("Hide finished tasks")
                    
                }
                
                Section(header: Text("Today")){
                    
                    ForEach(todaysTasks, id:\.self) { task in
                        TaskRow(task: task)
                    }
                    .onDelete(perform: removeTodayTask(at:))
                }
                .headerProminence(.increased)
                
                Section(header: Text("Tomorrow")){
                    
                    ForEach(tomorrowsTasks, id:\.self) { task in
                        TaskRow(task: task)
                        
                    }
                    .onDelete(perform: removeTomorrowTask(at:))
                    
                }
                              
                .headerProminence(.increased)
                
            }
            
            .navigationBarItems(trailing:
                                    HStack{
                addTaskButton()
                TaskOptionsButton(filterHealthTasks: $showHealthTasks, filterWorkTasks: $showWorkTasks, filterLearningTasks: $showLearningTasks)
            })
            .navigationTitle("Your Tasks")
            .scrollContentBackground(.hidden)
            .background(backgroundColour())
            
        }
        
    }
    
    func removeTodayTask(at offsets: IndexSet){
        let taskToBeRemoved: Task = todaysTasks[offsets[offsets.startIndex]]
        let taskIndex = taskModelData.tasks.firstIndex(where: {$0.id == taskToBeRemoved.id })!
        taskModelData.removeTask(taskindex: taskIndex)
                    
    }
    
    func removeTomorrowTask(at offsets: IndexSet){
        let taskToBeRemoved: Task = tomorrowsTasks[offsets[offsets.startIndex]]
        let taskIndex = taskModelData.tasks.firstIndex(where: {$0.id == taskToBeRemoved.id })!
        taskModelData.removeTask(taskindex: taskIndex)
                    
    }
    
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
            .environmentObject(TaskModelData())
    }
}
