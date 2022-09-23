//
//  userDefaultsExt.swift
//  bettr
//
//  Created by Henry Thomas on 30/07/2022.
//

import Foundation

extension UserDefaults{
    
    func decodeUser(key: users){
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(userData)
            
        } catch{
            print("Unable to encode userData (\(error))")
        }
    }
}
