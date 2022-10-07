//
//  AddTaskPopover.swift
//  bettr
//
//  Created by Henry Thomas on 28/09/2022.
//

import SwiftUI

struct AddTaskPopover: View {
    
    @EnvironmentObject var taskModelData: TaskModelData
    
    @Binding var showPopover: Bool
    
    @State private var taskTitle: String = ""
    @State private var taskDesc: String = ""
    @State private var datePick: Bool = true
    @State private var taskType: Task.Category = .fitness
    
    @State private var showingAlert: Bool = false
    
    var body: some View {
        
        ZStack {
            Color("newgrey")
                .edgesIgnoringSafeArea(.all)
            Form {
                Section{
                    Picker("Type", selection: $taskType){
                        Text("Fitness").tag(Task.Category.fitness)
                        Text("Work").tag(Task.Category.work)
                        Text("Education").tag(Task.Category.education)
                    }
                }
                Section(header: Text("TASK DETAILS")) {
                    TextField("Task Title", text: $taskTitle)
                    TextField("Task Description", text: $taskDesc)
                }
                
                Section(header: Text("TASK DAY"))  {
                    Picker("Date", selection: $datePick){
                        Text("Today").tag(true)
                        Text("Tomorrow").tag(false)
                        
                    }
                    .pickerStyle(.segmented)
                }
                
                Section{
                    Button(action: addTask){
                        Text("Add New Task")
                    }
                    .alert("Please fill out all fields", isPresented: $showingAlert){
                        Button("OK", role: .cancel){}
                    }
                }

            }
        }
        
    }
    
    func addTask(){
        print("popover add task button pressed")
        if(taskTitle == "" || taskDesc == "" ){
            showingAlert = true
        }
        else{
            let newID: Int = taskModelData.getNextID()
            let newTask: Task = Task(id: newID, title: taskTitle, state: false, description: taskDesc, dateSet: Date(), dateState: datePick, taskCategory: taskType)
            taskModelData.addTask(taskToBeAdded: newTask)
            showPopover.toggle()
        }
        
    }
}
