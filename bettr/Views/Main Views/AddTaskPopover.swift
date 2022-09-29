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
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("Task title:")
                    .font(.callout)
                    .bold()
                
                TextField("Enter title", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            VStack(alignment: .leading){
                Text("Task Description:")
                    .font(.callout)
                    .bold()
                
                TextEditor(text: $taskDesc)
                    .background(Color.gray)
                    .frame(minWidth: 0, minHeight: 0, maxHeight: 200)
                    .cornerRadius(10)
                
    
                
            }
            .padding()
        }
        
    }
}

struct AddTaskPopover_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskPopover()
    }
}
