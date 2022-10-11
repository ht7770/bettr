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
    
    func updateTask(taskIndex: Int, taskTitle: String, taskDesc: String, datePick: Bool){
        print("Updating Task: \(tasks[taskIndex].id)")
        tasks[taskIndex].title = taskTitle
        tasks[taskIndex].description = taskDesc
        tasks[taskIndex].dateState = datePick
        saveTaskModel()
    }

    
}

func addModelPlaceholder() -> [Task]{
    let initTask: Task = Task(id: 1001, title: "Your First Task", state: false, description: "This is your first task, you can add other tasks or delete this one", dateSet: Date(), dateState: true, taskCategory: Task.Category.work)
    let secondTask: Task = Task(id: 1002, title: "Your Second Task", state: true, description: "This is your Second task, you can add other tasks or delete this one", dateSet: Date(), dateState: true, taskCategory: Task.Category.health)
    let thirdTask: Task = Task(id: 1003, title: "Your Third Task", state: true, description: "This is your Third task, you can add other tasks or delete this one, it's scheduled for tomorrow", dateSet: Date(), dateState: false, taskCategory: Task.Category.learning)
    
    var initTasks: [Task] = []
    initTasks.append(initTask)
    initTasks.append(secondTask)
    initTasks.append(thirdTask)
    
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
