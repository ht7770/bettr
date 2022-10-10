//
//  task.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import Foundation
import SwiftUI

struct Task: Hashable, Codable, Identifiable{
    var id: Int
    var title: String
    var state: Bool
    var description: String
    var dateSet: Date
    var dateState: Bool
    
    var taskCategory: Category
       
    enum Category: String, CaseIterable, Codable{
        case fitness = "heart.fill"
        case work = "command"
        case education = "brain"
    }
    
        
    var image: Image{
        Image(systemName: taskCategory.rawValue)
    }
    
    func getState() -> String{
        if self.state == false{
            return "To-do"
        }
        else{
            return "Completed"
        }
        
    }
    
}
