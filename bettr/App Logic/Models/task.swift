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
        case health = "heart.fill"
        case work = "briefcase.fill"
        case learning = "book.fill"
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
