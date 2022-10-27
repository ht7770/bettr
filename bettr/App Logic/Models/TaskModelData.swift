//
//  TaskModelData.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import Foundation
import Combine
import UserNotifications


final class TaskModelData: ObservableObject{
   
    @Published var tasks: [Task] = loadTaskModel()
    @Published var profile: User = loadUser()
    @Published var notloggedIn: Bool = loadLoggedInStatus()
    
    init(){
        NotificationHandler.shared.requestNotificationPermission(completion: { (permissionGranted) in
            self.profile.hasEnabledNotifications = permissionGranted
        })
    }
    
    func updateModel(){
        pruneTasks()
        notificationUpdate()
        saveTaskModel()
    }
                                                                
    
    func pruneTasks(){
        var tasksIndexToBePruned : [Int] = []
        var tasksToBeAdded : [Task] = []
        print("Pruning Tasks...")
        for (index, task) in tasks.enumerated(){
            if (!task.dateState) && (!Calendar.current.isDate(Date(), inSameDayAs: task.dateSet)) && profile.automaticallyMoveTasks {
                tasksIndexToBePruned.append(index)
                let newTask = Task(id: task.id, title: task.title, state: task.state, description: task.description, dateSet: Date(), dateState: true, taskCategory: task.taskCategory)
                tasksToBeAdded.append(newTask)
            }
        }
        for index in tasksIndexToBePruned{
            removeTask(taskindex: index)
        }
        
        for task in tasksToBeAdded{
            addTask(taskToBeAdded: task)
        }
    }
    
    func notificationUpdate(){
        var incompleteCount: Int = 0
        for task in tasks{
            if task.state == false && task.dateState == true {
                incompleteCount += 1

            }
        }
        if profile.hasEnabledNotifications{
            print("Updating local notifications with latest data...")
            NotificationHandler.shared.endOfDayReminder(inCompleteCount: incompleteCount)
        }
    }
    
    
    func removeTask(at offsets: IndexSet){
        let taskToBeRemoved = tasks[offsets[offsets.startIndex]]
        print("Removing task: \(taskToBeRemoved.title)")
        tasks.remove(atOffsets: offsets)
        saveTaskModel()
        
    }
    
    func removeTask(taskindex: Int){
        let taskToBeRemoved = tasks[taskindex]
        print("Removing task: \(taskToBeRemoved.title)")
        tasks.remove(at: taskindex)
        saveTaskModel()
    }
    

    func checkLoggedIn(){
        if profile.firstName == "John" && profile.lastName == "Appleseed"{
            notloggedIn = true
        } else {
            notloggedIn = false
        }
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
    
    func saveUser(){
        print("Saving user: \(profile.firstName)")
        UserDefaults.standard.storeCodable(profile, key: "profile")
        checkLoggedIn()
    }
    
    func updateTask(taskIndex: Int, taskTitle: String, taskDesc: String, datePick: Bool){
        print("Updating Task: \(tasks[taskIndex].id)")
        tasks[taskIndex].title = taskTitle
        tasks[taskIndex].description = taskDesc
        tasks[taskIndex].dateState = datePick
        saveTaskModel()
    }
    
    func resetModel(){
        print("Resetting model...")
        UserDefaults.standard.removeObject(forKey: "taskModel")
        UserDefaults.standard.removeObject(forKey: "profile")
        tasks = loadTaskModel()
        profile = loadUser()
        notloggedIn = loadLoggedInStatus()
    }
    
 
    
}

func addModelPlaceholder() -> [Task]{
    let initTask: Task = Task(id: 1001, title: "Your First Task", state: false, description: "This is your first task, you can add other tasks or delete this one", dateSet: Date(), dateState: true, taskCategory: Task.Category.work)
    let secondTask: Task = Task(id: 1002, title: "Your Second Task", state: false, description: "This is your Second task, you can add other tasks or delete this one", dateSet: Date(), dateState: true, taskCategory: Task.Category.health)
    let thirdTask: Task = Task(id: 1003, title: "Your Third Task", state: false, description: "This is your Third task, you can add other tasks or delete this one, it's scheduled for tomorrow", dateSet: Date(), dateState: false, taskCategory: Task.Category.learning)
    
    var initTasks: [Task] = []
    initTasks.append(initTask)
    initTasks.append(secondTask)
    initTasks.append(thirdTask)
    
    return initTasks
}


func loadTaskModel() -> [Task]{
    let optionalLoadedTasks: [Task]? = UserDefaults.standard.retrieveCodable(for: "taskModel", castTo: [Task].self)
    
    if optionalLoadedTasks != nil{
        print("Found a tasks model! Loading...")
        let loadedTasks: [Task] = optionalLoadedTasks!
        return loadedTasks
    }
    else{
        print("Couldn't find any stored tasks model, starting with init tasks")
        return addModelPlaceholder()
    }
}

func loadUser() -> User{
    let optionalLoadedProfile: User? = UserDefaults.standard.retrieveCodable(for: "profile", castTo: User.self)
    
    if optionalLoadedProfile != nil{
        print("Found a user! Loading...")
        let loadedUser: User = optionalLoadedProfile!
        return loadedUser
    }
    else{
        print("Couldn't find any stored user, starting with default")
        return User.default
    }
}

func loadLoggedInStatus() -> Bool{
    let optionalLoadedProfile: User? = UserDefaults.standard.retrieveCodable(for: "profile", castTo: User.self)
    
    if optionalLoadedProfile != nil{
        let loadedUser: User = optionalLoadedProfile!
        if loadedUser.firstName == "John" && loadedUser.lastName == "Appleseed"{
            return true
        }
        else{ return false }
    }
    else{ return true }
}
