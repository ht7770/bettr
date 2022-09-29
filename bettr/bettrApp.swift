//
//  bettrApp.swift
//  bettr
//
//  Created by Henry Thomas on 31/12/2021.
//

import SwiftUI
import Foundation


@main
struct bettrApp: App {
    
    @StateObject private var taskModelData = TaskModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskModelData)
        }
    }
}
