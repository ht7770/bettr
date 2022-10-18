//
//  ContentView.swift
//  bettr
//
//  Created by Henry Thomas on 31/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection: Tab = .tasks
    
    enum Tab{
        case tasks
        case settings
        
    }
    
    init(){
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        TabView(selection: $tabSelection){
            TaskList()
                .tabItem{
                    Label("Tasks", systemImage: "list.bullet")
                }
                .tag(Tab.tasks)
            
            
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
        
        .accentColor(Color("tabFontColour"))
        

            
        }
    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskModelData())
    }
}


