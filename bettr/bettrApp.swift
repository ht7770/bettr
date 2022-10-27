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
    

    @Environment(\.scenePhase) private var scenePhase
    
    @StateObject private var taskModelData = TaskModelData()
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskModelData)

            }
        .onChange(of: scenePhase){ phase in
            if phase == .background{
                taskModelData.updateModel()
            }
            else if phase == .active{
                taskModelData.updateModel()
            }
        }
    }
}
