//
//  TaskRow.swift
//  bettr
//
//  Created by Henry Thomas on 23/09/2022.
//

import SwiftUI

struct TaskRow: View {
    var task: Task
    
    var body: some View {
            HStack {
                task.image
                    .resizable()
                    .offset(x: 10)
                    .frame(width: 30, height: 30)
                VStack(alignment: .leading) {
                    Text(task.title)
                        .bold()

                    HStack {
                        Text(task.getState())
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                        
                }
                .offset(x: 10)
                
                Spacer()
            }
        }
    }

struct TaskRow_Previews: PreviewProvider {
    static var tasks = TaskModelData().tasks
    static var previews: some View {
        Group {
            TaskRow(task: tasks[0])
        }
    }
}
