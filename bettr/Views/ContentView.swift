//
//  ContentView.swift
//  bettr
//
//  Created by Henry Thomas on 31/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var taskModelData: TaskModelData
    
    @State private var tabSelection: Tab = .tasks
    @State private var draftProfile = User.default
    
    enum Tab{
        case tasks
        case settings
        case profile
        
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
            
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(Tab.profile)
            
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
            
        }
        .accentColor(Color("tabFontColour"))
        .popover(isPresented: $taskModelData.notloggedIn){
            EditProfile(showPopover: $taskModelData.notloggedIn, profile: $draftProfile)
                .environmentObject(taskModelData)
                .onAppear {
                    draftProfile = taskModelData.profile
                }
                .onDisappear {
                    taskModelData.profile = draftProfile
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskModelData())
    }
}


