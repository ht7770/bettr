//
//  bettrApp.swift
//  bettr
//
//  Created by Henry Thomas on 31/12/2021.
//

import SwiftUI

@main
struct bettrApp: App {
    
    @State var loggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            
            if loggedIn{
                ContentView()
            }
            else{
                SignUp(loggedIn: $loggedIn)
            }
        }
    }
}
