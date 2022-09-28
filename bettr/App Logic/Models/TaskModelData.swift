//
//  TaskModelData.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import Foundation
import Combine

// Create array of tasks

final class TaskModelData: ObservableObject{
    
    @Published var tasks: [Task] = addModelPlaceholder()
    
    
    func removeTask(at offsets: IndexSet){
        let taskToBeRemoved = tasks[offsets[offsets.startIndex]].title
        print("Removing task: \(taskToBeRemoved)")
        tasks.remove(atOffsets: offsets)
        
    }
    
    func removeTask(taskindex: Int){
        let taskToBeRemoved = tasks[taskindex].title
        print("Removing task: \(taskToBeRemoved)")
        tasks.remove(at: taskindex)
    }
    
    func addTask(taskToBeAdded: Task){
        tasks.append(taskToBeAdded)
    }
}

func addModelPlaceholder() -> [Task]{
    let initTask: Task = Task(id: 1001, title: "Your First Task", state: false, description: "This is your first task, you can add other tasks or delete this one", dateSet: Date(), dateComplete: Date())
    let secondTask: Task = Task(id: 1002, title: "Your Second Task", state: true, description: "This is your Second task, you can add other tasks or delete this one", dateSet: Date(), dateComplete: Date())
    
    var initTasks: [Task] = []
    initTasks.append(initTask)
    initTasks.append(secondTask)
    
    return initTasks
}



