//
//  EditProfile.swift
//  bettr
//
//  Created by Henry Thomas on 21/10/2022.
//

import SwiftUI

struct EditProfile: View {
    
    @EnvironmentObject var taskModelData: TaskModelData
    
    @State var showingAlert: Bool = false
    
    @Binding var showPopover: Bool
    @Binding var profile: User
    
    
    var body: some View {
        ZStack {
            Color("newgrey")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer(minLength: 50)
                
                ZStack{
                    Circle()
                        .fill(Color("circleFill"))
                        .frame(width: 120, height: 120)
                    
                    Image(systemName: "person.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color("categoryColour"))
                        .padding()
                }
                Spacer()
            Form{
                Section(header: Text("Name")) {
                    TextField("First Name", text: $profile.firstName)
                    TextField("Last Name", text: $profile.lastName)
                }
                
                Section(header: Text("Health Goal")) {
                    Stepper("\(profile.healthGoal)", value: $profile.healthGoal, in: 0...100, step: 5)
                }
                
                Section(header: Text("Work Goal")) {
                    Stepper("\(profile.workGoal)", value: $profile.workGoal, in: 0...100, step: 5)
                }
                
                Section(header: Text("Learning Goal")) {
                    Stepper("\(profile.learningGoal)", value: $profile.learningGoal, in: 0...100, step: 5)
                }
                
                Section{
                    Button(action: changeProfile){
                        Text("Change Profile")
                    }
                    .alert("Please fill out all fields", isPresented: $showingAlert){
                        Button("OK", role: .cancel){}
                        }
                    }
                }
            }
        }
    }
    
    func changeProfile(){
        print("change profile button pressed")
        if(profile.firstName == "" || profile.lastName == "" ){
            showingAlert = true
        }
        else{
            /// NEEDS FIXING ON SIGNUP 
            taskModelData.saveUser()
            showPopover = false
        }
        
    }
}

