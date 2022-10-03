//
//  TaskModelData.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import Foundation
import Combine


final class TaskModelData: ObservableObject{
    
    @Published var tasks: [Task] = loadTaskModel()
    
    
    func removeTask(at offsets: IndexSet){
        let taskToBeRemoved = tasks[offsets[offsets.startIndex]].title
        print("Removing task: \(taskToBeRemoved)")
        tasks.remove(atOffsets: offsets)
        saveTaskModel()
        
    }
    
    func removeTask(taskindex: Int){
        let taskToBeRemoved = tasks[taskindex].title
        print("Removing task: \(taskToBeRemoved)")
        tasks.remove(at: taskindex)
        saveTaskModel()
    }
    
    func addTask(taskToBeAdded: Task){
        print("Adding task to list: \(taskToBeAdded.title)")
        tasks.append(taskToBeAdded)
        saveTaskModel()
    }
    
    func getNextID() -> Int{
        if let currentTask = tasks.last {
            let nextID = currentTask.id + 1
            print("Assigning ID: \(nextID)")
            return nextID
        } else {
            let nextID = 1001
            print("Tasks array is empty, assigning first ID: \(nextID)")
            return nextID
        }
    }
    
    func saveTaskModel(){
        print("Saving tasks model...")
        UserDefaults.standard.storeCodable(tasks, key: "taskModel")
    }
    
}

func addModelPlaceholder() -> [Task]{
    let initTask: Task = Task(id: 1001, title: "Your First Task", state: false, description: "This is your first task, you can add other tasks or delete this one", dateSet: Date(), dateState: true)
    let secondTask: Task = Task(id: 1002, title: "Your Second Task", state: true, description: "This is your Second task, you can add other tasks or delete this one", dateSet: Date(), dateState: true)
    
    var initTasks: [Task] = []
    initTasks.append(initTask)
    initTasks.append(secondTask)
    
    return initTasks
}


func loadTaskModel() -> [Task]{
    let optionalLoadedTasks: [Task]? = UserDefaults.standard.retrieveCodable(for: "taskModel", castTo: [Task].self)
    
    if optionalLoadedTasks != nil{
        print("Found a tasks model! loading...")
        let loadedTasks: [Task] = optionalLoadedTasks!
        return loadedTasks
    }
    else{
        print("Couldn't find any stored tasks model, starting with init tasks")
        return addModelPlaceholder()
    }
}
