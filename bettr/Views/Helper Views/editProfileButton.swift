//
//  editProfileButton.swift
//  bettr
//
//  Created by Henry Thomas on 21/10/2022.
//

import SwiftUI

struct editProfileButton: View {
    
    @State private var showPopover = false
    
    @Binding var profile: User
    
    
    var body: some View {
        HStack{
            Button(action: editProfileFunc){
                Text("Edit")
            }
            .foregroundColor(.white)
            .bold()
            
        }
        .popover(isPresented: $showPopover){
            EditProfile(showPopover: $showPopover, profile: $profile)
        }
    }
    
    func editProfileFunc(){
        print("edit profile button tapped")
        showPopover = true
    }
}

