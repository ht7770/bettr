//
//  AddTaskPopover.swift
//  bettr
//
//  Created by Henry Thomas on 28/09/2022.
//

import SwiftUI

struct AddTaskPopover: View {
    
    @State private var taskTitle: String = ""
    @State private var taskDesc: String = ""
    @State private var datePick: Bool = true
    
    var body: some View {
        
        ZStack {
            Color("newgrey")
                .edgesIgnoringSafeArea(.all)
            Form {
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

            }
        }
        
    }
}

struct AddTaskPopover_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskPopover()
    }
}
