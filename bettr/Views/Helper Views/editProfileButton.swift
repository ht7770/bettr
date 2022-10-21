//
//  editProfileButton.swift
//  bettr
//
//  Created by Henry Thomas on 21/10/2022.
//

import SwiftUI

struct editProfileButton: View {
    
    @State private var showPopover = false
    
    var body: some View {
        HStack{
            Button(action: editProfileFunc){
                Text("Edit")
            }
            .foregroundColor(.white)
            .bold()
            
        }
        .popover(isPresented: $showPopover){
            EditProfile()
        }
    }
    
    func editProfileFunc(){
        print("edit profile button tapped")
        showPopover = true
    }
}

struct editProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        editProfileButton()
    }
}
