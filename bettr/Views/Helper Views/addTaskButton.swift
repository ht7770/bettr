//
//  addTaskButton.swift
//  bettr
//
//  Created by Henry Thomas on 27/09/2022.
//

import SwiftUI

struct addTaskButton: View {
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
    }
    
    func addTask(){
        print("add task button tapped")
    }
}

struct addTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        addTaskButton()
    }
}
