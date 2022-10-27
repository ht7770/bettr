//
//  refreshButton.swift
//  bettr
//
//  Created by Henry Thomas on 27/10/2022.
//

import SwiftUI

struct refreshButton: View {
    
    @EnvironmentObject var taskModelData: TaskModelData
    var body: some View {
        Button(action: taskModelData.updateModel) {
            HStack{
                Image(systemName: "arrow.clockwise")
            }
            .foregroundColor(.white)
            .bold()
        }
        
    }
}
struct refreshButton_Previews: PreviewProvider {
    static var previews: some View {
        refreshButton()
            .environmentObject(TaskModelData())
    }
}
