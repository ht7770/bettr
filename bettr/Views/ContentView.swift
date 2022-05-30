//
//  ContentView.swift
//  bettr
//
//  Created by Henry Thomas on 31/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    var newUser: users
    
    var body: some View {
        
        ZStack{
            backgroundColour()
            VStack{
                WelcomeMessage(name: newUser.firstName)
                Spacer()
                
                }
             
            }
        }

            
    }

