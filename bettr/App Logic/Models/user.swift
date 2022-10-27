//
//  user.swift
//  bettr
//
//  Created by Henry Thomas on 19/10/2022.
//

import Foundation
import SwiftUI

struct User: Codable{
    
    var firstName: String
    var lastName: String
    
    var healthGoal: Int = 10
    var workGoal: Int = 10
    var learningGoal: Int = 10
    
    var healthCompleted: Int = 0
    var workCompleted: Int = 0
    var learningCompleted: Int = 0
    
    var hasEnabledNotifications: Bool = false
    var automaticallyMoveTasks: Bool = false
    
    
    static let `default` = User(firstName: "John", lastName: "Appleseed")
    
    mutating func increaseTaskCount(task: Task){
        let taskCategory = task.taskCategory
        print("Adding to task counter: \(taskCategory)")
        if taskCategory == Task.Category.health {
            healthCompleted += 1
        }
        else if taskCategory == Task.Category.learning {
            learningCompleted += 1
        }
        else if taskCategory == Task.Category.work {
            workCompleted += 1
        }
        
    }
    
    mutating func changeNotifcationPermissions(newValue: Bool){
        hasEnabledNotifications = newValue
    }
    
    
}
