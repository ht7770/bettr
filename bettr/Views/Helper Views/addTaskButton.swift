//
//  addTaskButton.swift
//  bettr
//
//  Created by Henry Thomas on 27/09/2022.
//

import SwiftUI

struct addTaskButton: View {
    
    @State private var showPopover = false
    
    var body: some View {
        HStack {
            Button(action: addTask) {
                HStack{
                    Image(systemName: "plus")
                    Text("Add")
                }
                .foregroundColor(.white)
                .bold()
            }
            Spacer()
        }
        .popover(isPresented: $showPopover){
            AddTaskPopover()
        }
    }
    
    func addTask(){
        print("add task button tapped")
        showPopover = true
        
    }
}

struct addTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        addTaskButton()
    }
}
