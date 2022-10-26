//
//  SettingsView.swift
//  bettr
//
//  Created by Henry Thomas on 18/10/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var taskModelData: TaskModelData
    
    var body: some View {
        NavigationView{
            Form{
                
                Section(header: Text("ABOUT")){
                    HStack{
                        Text("Version")
                        Spacer()
                        Text("1.0")
                    }
                    
                }
                
                Section{
                    Button(action: {
                        print("Erase all settings pressed!")
                        taskModelData.resetModel()
                    }, label: {
                        Text("Erase all Content and Settings")
                            .foregroundColor(Color.red)
                    })
                    }
                }
            .navigationTitle("Settings")
            .scrollContentBackground(.hidden)
            .background(backgroundColour())
           
                
            }

        }
    }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
