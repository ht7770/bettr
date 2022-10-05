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
    
    var category: Category
       
    enum Category: String, CaseIterable, Codable{
        case fitness = "fitness"
        case work = "work"
        case education = "education"
    }
    
    var imageName: String = "aqi.medium"
    var image: Image{
        Image(systemName: imageName)
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
