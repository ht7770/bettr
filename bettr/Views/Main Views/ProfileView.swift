//
//  ProfileView.swift
//  bettr
//
//  Created by Henry Thomas on 19/10/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var taskModelData: TaskModelData
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Personal Details")){
                    HStack{
                        Text("First Name")
                        Spacer()
                        Text(taskModelData.profile.firstName)
                    }
                    HStack{
                        Text("Last Name")
                        Spacer()
                        Text(taskModelData.profile.lastName)
                    }
                    
                }
                Section(header: Text("Monthly Goals")) {
                    HStack{
                        Text("Health")
                        Spacer()
                        Text("\(taskModelData.profile.healthCompleted) / \(taskModelData.profile.healthGoal)")
                    }
                    HStack{
                        Text("Work")
                        Spacer()
                        Text("\(taskModelData.profile.workCompleted) / \(taskModelData.profile.workGoal)")
                    }
                    HStack{
                        Text("Learning")
                        Spacer()
                        Text("\(taskModelData.profile.learningCompleted) / \(taskModelData.profile.learningGoal)")
                    }
                }
            }
            .navigationBarItems(trailing: editProfileButton(profile: $taskModelData.profile))
            .navigationTitle("Profile")
            .scrollContentBackground(.hidden)
            .background(backgroundColour())
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(TaskModelData())
    }
}
