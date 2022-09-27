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
    var dateComplete: Date
    
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