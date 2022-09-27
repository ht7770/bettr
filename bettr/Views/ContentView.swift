//
//  ContentView.swift
//  bettr
//
//  Created by Henry Thomas on 31/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TaskList()
            
        }
    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskModelData())
    }
}


