//
//  EditTaskPopover.swift
//  bettr
//
//  Created by Henry Thomas on 03/10/2022.
//

import SwiftUI

struct EditTaskPopover: View {
    @EnvironmentObject var taskModelData: TaskModelData
    
    @Binding var showPopover: Bool
    
    @State private var showingAlert: Bool = false
    
    var taskIndex: Int
    
    var body: some View {
        
        ZStack {
            Color("newgrey")
                .edgesIgnoringSafeArea(.all)
            Form {
                Section(header: Text("TASK DETAILS")) {
                    TextField("Task Title", text: $taskModelData.tasks[taskIndex].title)
                    TextField("Task Description", text: $taskModelData.tasks[taskIndex].description)
                }
                
                Section(header: Text("TASK DAY"))  {
                    Picker("Date", selection: $taskModelData.tasks[taskIndex].dateState){
                        Text("Today").tag(true)
                        Text("Tomorrow").tag(false)
                        
                    }
                    .pickerStyle(.segmented)
                }
                
                Section{
                    Button(action: editTask){
                        Text("Edit Task")
                    }
                    .alert("Please fill out all fields", isPresented: $showingAlert){
                        Button("OK", role: .cancel){}
                    }
                }
            }
        }
    }
    
    func editTask(){
        print("popover edit task button pressed")
        if(taskModelData.tasks[taskIndex].title == "" || taskModelData.tasks[taskIndex].description == "" ){
            showingAlert = true
        }
        else{
            showPopover.toggle()
            taskModelData.saveTaskModel()
        }
    }
}



