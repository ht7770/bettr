//
//  user.swift
//  bettr
//
//  Created by Henry Thomas on 19/10/2022.
//

import Foundation
import SwiftUI

struct User: Hashable, Codable{
    
    var id: Int
    var firstName: String
    var lastName: String
    var healthCompleted: Int
    var workCompleted: Int
    var learningCompleted: Int
    
    
}
